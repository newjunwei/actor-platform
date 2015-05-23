//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/ServiceExChangedTitle.java
//


#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/ServiceEx.h"
#include "im/actor/model/api/ServiceExChangedTitle.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/droidkit/bser/util/SparseArray.h"
#include "java/io/IOException.h"

@interface ImActorModelApiServiceExChangedTitle () {
 @public
  NSString *title_;
}

@end

J2OBJC_FIELD_SETTER(ImActorModelApiServiceExChangedTitle, title_, NSString *)

@implementation ImActorModelApiServiceExChangedTitle

- (instancetype)initWithNSString:(NSString *)title {
  ImActorModelApiServiceExChangedTitle_initWithNSString_(self, title);
  return self;
}

- (instancetype)init {
  ImActorModelApiServiceExChangedTitle_init(self);
  return self;
}

- (jint)getHeader {
  return 5;
}

- (NSString *)getTitle {
  return self->title_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->title_ = [((BSBserValues *) nil_chk(values)) getStringWithInt:1];
  if ([values hasRemaining]) {
    [self setUnmappedObjectsWithImActorModelDroidkitBserUtilSparseArray:[values buildRemaining]];
  }
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  if (self->title_ == nil) {
    @throw new_JavaIoIOException_init();
  }
  [((BSBserWriter *) nil_chk(writer)) writeStringWithInt:1 withNSString:self->title_];
  if ([self getUnmappedObjects] != nil) {
    ImActorModelDroidkitBserUtilSparseArray *unmapped = [self getUnmappedObjects];
    for (jint i = 0; i < [((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(unmapped)) size]; i++) {
      jint key = [unmapped keyAtWithInt:i];
      [writer writeUnmappedWithInt:key withId:[unmapped getWithInt:key]];
    }
  }
}

- (NSString *)description {
  NSString *res = @"struct ServiceExChangedTitle{";
  res = JreStrcat("$$", res, JreStrcat("$$", @"title=", self->title_));
  res = JreStrcat("$C", res, '}');
  return res;
}

@end

void ImActorModelApiServiceExChangedTitle_initWithNSString_(ImActorModelApiServiceExChangedTitle *self, NSString *title) {
  (void) ImActorModelApiServiceEx_init(self);
  self->title_ = title;
}

ImActorModelApiServiceExChangedTitle *new_ImActorModelApiServiceExChangedTitle_initWithNSString_(NSString *title) {
  ImActorModelApiServiceExChangedTitle *self = [ImActorModelApiServiceExChangedTitle alloc];
  ImActorModelApiServiceExChangedTitle_initWithNSString_(self, title);
  return self;
}

void ImActorModelApiServiceExChangedTitle_init(ImActorModelApiServiceExChangedTitle *self) {
  (void) ImActorModelApiServiceEx_init(self);
}

ImActorModelApiServiceExChangedTitle *new_ImActorModelApiServiceExChangedTitle_init() {
  ImActorModelApiServiceExChangedTitle *self = [ImActorModelApiServiceExChangedTitle alloc];
  ImActorModelApiServiceExChangedTitle_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiServiceExChangedTitle)
