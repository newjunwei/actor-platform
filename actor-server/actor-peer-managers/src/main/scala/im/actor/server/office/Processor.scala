package im.actor.server.office

import java.util.concurrent.TimeUnit

import scala.collection.immutable
import scala.concurrent.Future
import scala.concurrent.duration._
import scala.language.postfixOps
import scala.util.{ Failure, Success }

import akka.actor.{ ActorLogging, Status }
import akka.contrib.pattern.ShardRegion.Passivate
import akka.pattern.pipe
import akka.persistence.PersistentActor
import org.joda.time.DateTime

case object StopOffice

trait Processor extends PersistentActor with ActorLogging {
  private val passivationIntervalMs = context.system.settings.config.getDuration("office.passivation-interval", TimeUnit.MILLISECONDS)
  private implicit val ec = context.dispatcher

  type OfficeState
  type OfficeEvent

  protected def workWith(e: OfficeEvent, s: OfficeState): Unit

  override def preRestart(reason: Throwable, message: Option[Any]): Unit = {
    log.error(reason, "Failure while processing message {}", message)

    super.preRestart(reason, message)
  }

  protected def stashing(evt: Any): Receive = {
    case msg ⇒
      log.debug("Stashing while event processing. Message: {}, Event: {}", msg, evt)
      stash()
  }

  def persistReply[R](e: OfficeEvent)(onComplete: OfficeEvent ⇒ Any)(f: OfficeEvent ⇒ Future[R]): Unit = {
    persist(e) { evt ⇒
      f(evt) pipeTo sender() onComplete {
        case Success(_) ⇒

        case Failure(f) ⇒
          log.error(f, "Failure while processing event {}", evt)
      }

      onComplete(evt)
    }
  }

  def persistStashing[R](e: OfficeEvent)(onComplete: OfficeEvent ⇒ Any)(f: OfficeEvent ⇒ Future[R]): Unit = {
    context become stashing(e)

    persistAsync(e) { evt ⇒
      f(evt) andThen {
        case Success(_) ⇒
          onComplete(evt)
          unstashAll()
        case Failure(f) ⇒
          log.error(f, "Failure while processing event {}", e)
          onComplete(evt)
          unstashAll()
      }
    }
  }

  def persistStashingReply[R](e: OfficeEvent)(onComplete: OfficeEvent ⇒ Any)(f: OfficeEvent ⇒ Future[R]): Unit = {
    val replyTo = sender()

    context become stashing(e)

    persistAsync(e) { evt ⇒
      f(evt) pipeTo replyTo onComplete {
        case Success(r) ⇒
          onComplete(evt)
          unstashAll()
        case Failure(f) ⇒
          log.error(f, "Failure while processing event {}", e)
          replyTo ! Status.Failure(f)

          onComplete(evt)
          unstashAll()
      }
    }
  }

  def persistStashingReply[R](es: immutable.Seq[OfficeEvent])(onComplete: OfficeEvent ⇒ Any)(f: immutable.Seq[OfficeEvent] ⇒ Future[R]): Unit = {
    val replyTo = sender()

    context become stashing(es)

    persistAsync(es)(_ ⇒ ())

    defer(()) { _ ⇒
      f(es) pipeTo replyTo onComplete {
        case Success(_) ⇒
          es foreach onComplete
          unstashAll()
        case Failure(e) ⇒
          log.error(e, "Failure while processing event {}", e)
          replyTo ! Status.Failure(e)

          es foreach onComplete
          unstashAll()
      }
    }
  }

  def now(): DateTime = new DateTime()

  if (passivationIntervalMs > 0) {
    log.warning("Passivating in {} ms", passivationIntervalMs)

    val interval = passivationIntervalMs.milliseconds
    context.system.scheduler.scheduleOnce(interval, context.parent, Passivate(stopMessage = StopOffice))
  }
}
