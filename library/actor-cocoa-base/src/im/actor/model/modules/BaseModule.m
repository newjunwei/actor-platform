//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/BaseModule.java
//


#include "J2ObjC_source.h"
#include "im/actor/model/Configuration.h"
#include "im/actor/model/CryptoProvider.h"
#include "im/actor/model/MainThreadProvider.h"
#include "im/actor/model/StorageProvider.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/engine/KeyValueEngine.h"
#include "im/actor/model/droidkit/engine/PreferencesStorage.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/modules/Auth.h"
#include "im/actor/model/modules/BaseModule.h"
#include "im/actor/model/modules/Groups.h"
#include "im/actor/model/modules/Messages.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/Updates.h"
#include "im/actor/model/modules/Users.h"
#include "im/actor/model/network/ActorApi.h"
#include "im/actor/model/network/RpcCallback.h"
#include "im/actor/model/network/RpcException.h"
#include "im/actor/model/network/parser/Request.h"
#include "im/actor/model/network/parser/Response.h"
#include "java/lang/Runnable.h"

@interface ImActorModelModulesBaseModule () {
 @public
  ImActorModelModulesModules *modules__;
}

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesBaseModule, modules__, ImActorModelModulesModules *)

@interface ImActorModelModulesBaseModule_$1 : NSObject < AMRpcCallback >

- (void)onResult:(ImActorModelNetworkParserResponse *)response;

- (void)onError:(AMRpcException *)e;

- (instancetype)init;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesBaseModule_$1)

__attribute__((unused)) static void ImActorModelModulesBaseModule_$1_init(ImActorModelModulesBaseModule_$1 *self);

__attribute__((unused)) static ImActorModelModulesBaseModule_$1 *new_ImActorModelModulesBaseModule_$1_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesBaseModule_$1)

NSString *ImActorModelModulesBaseModule_STORAGE_DIALOGS_ = @"dialogs";
NSString *ImActorModelModulesBaseModule_STORAGE_USERS_ = @"users";
NSString *ImActorModelModulesBaseModule_STORAGE_GROUPS_ = @"groups";
NSString *ImActorModelModulesBaseModule_STORAGE_DOWNLOADS_ = @"downloads";
NSString *ImActorModelModulesBaseModule_STORAGE_CONTACTS_ = @"contacts";
NSString *ImActorModelModulesBaseModule_STORAGE_NOTIFICATIONS_ = @"notifications";
NSString *ImActorModelModulesBaseModule_STORAGE_SEARCH_ = @"search";
NSString *ImActorModelModulesBaseModule_STORAGE_CHAT_PREFIX_ = @"chat_";
NSString *ImActorModelModulesBaseModule_STORAGE_CHAT_MEDIA_PREFIX_ = @"chat_media_";
NSString *ImActorModelModulesBaseModule_STORAGE_PENDING_ = @"chat_pending";
NSString *ImActorModelModulesBaseModule_STORAGE_CURSOR_ = @"chat_cursor";

@implementation ImActorModelModulesBaseModule

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)modules {
  ImActorModelModulesBaseModule_initWithImActorModelModulesModules_(self, modules);
  return self;
}

- (ImActorModelModulesModules *)modules {
  return modules__;
}

- (ImActorModelModulesUpdates *)updates {
  return [((ImActorModelModulesModules *) nil_chk(modules__)) getUpdatesModule];
}

- (void)runOnUiThreadWithJavaLangRunnable:(id<JavaLangRunnable>)runnable {
  [((id<AMMainThreadProvider>) nil_chk([((AMConfiguration *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getConfiguration])) getMainThreadProvider])) postToMainThreadWithRunnable:runnable];
}

- (DKActorRef *)sendActor {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getSendMessageActor];
}

- (DKActorRef *)dialogsActor {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getDialogsActor];
}

- (DKActorRef *)dialogsHistoryActor {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getDialogsHistoryActor];
}

- (DKActorRef *)ownReadActor {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getOwnReadActor];
}

- (DKActorRef *)plainReceiveActor {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getPlainReceiverActor];
}

- (DKActorRef *)conversationActorWithAMPeer:(AMPeer *)peer {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getConversationActorWithAMPeer:peer];
}

- (DKActorRef *)conversationHistoryActorWithAMPeer:(AMPeer *)peer {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getConversationHistoryActorWithAMPeer:peer];
}

- (id<DKPreferencesStorage>)preferences {
  return [((ImActorModelModulesModules *) nil_chk(modules__)) getPreferences];
}

- (id<AMCryptoProvider>)crypto {
  return [((AMConfiguration *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getConfiguration])) getCryptoProvider];
}

- (id<AMStorageProvider>)storage {
  return [((AMConfiguration *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getConfiguration])) getStorageProvider];
}

- (jint)myUid {
  return [((ImActorModelModulesAuth *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getAuthModule])) myUid];
}

- (void)requestWithImActorModelNetworkParserRequest:(ImActorModelNetworkParserRequest *)request
                                  withAMRpcCallback:(id<AMRpcCallback>)callback {
  [((AMActorApi *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getActorApi])) requestWithImActorModelNetworkParserRequest:request withAMRpcCallback:callback];
}

- (void)requestWithImActorModelNetworkParserRequest:(ImActorModelNetworkParserRequest *)request {
  [((AMActorApi *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getActorApi])) requestWithImActorModelNetworkParserRequest:request withAMRpcCallback:new_ImActorModelModulesBaseModule_$1_init()];
}

- (id<DKKeyValueEngine>)users {
  return [((ImActorModelModulesUsers *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getUsersModule])) getUsers];
}

- (id<DKKeyValueEngine>)groups {
  return [((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getGroupsModule])) getGroups];
}

@end

void ImActorModelModulesBaseModule_initWithImActorModelModulesModules_(ImActorModelModulesBaseModule *self, ImActorModelModulesModules *modules) {
  (void) NSObject_init(self);
  self->modules__ = modules;
}

ImActorModelModulesBaseModule *new_ImActorModelModulesBaseModule_initWithImActorModelModulesModules_(ImActorModelModulesModules *modules) {
  ImActorModelModulesBaseModule *self = [ImActorModelModulesBaseModule alloc];
  ImActorModelModulesBaseModule_initWithImActorModelModulesModules_(self, modules);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesBaseModule)

@implementation ImActorModelModulesBaseModule_$1

- (void)onResult:(ImActorModelNetworkParserResponse *)response {
}

- (void)onError:(AMRpcException *)e {
}

- (instancetype)init {
  ImActorModelModulesBaseModule_$1_init(self);
  return self;
}

@end

void ImActorModelModulesBaseModule_$1_init(ImActorModelModulesBaseModule_$1 *self) {
  (void) NSObject_init(self);
}

ImActorModelModulesBaseModule_$1 *new_ImActorModelModulesBaseModule_$1_init() {
  ImActorModelModulesBaseModule_$1 *self = [ImActorModelModulesBaseModule_$1 alloc];
  ImActorModelModulesBaseModule_$1_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesBaseModule_$1)
