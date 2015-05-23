//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/mvvm/MVVMCollection.java
//

#ifndef _AMMVVMCollection_H_
#define _AMMVVMCollection_H_

#include "J2ObjC_header.h"

@class AMBaseValueModel;
@class IOSByteArray;
@protocol DKKeyValueEngine;
@protocol DKKeyValueItem;
@protocol DKKeyValueStorage;

@interface AMMVVMCollection : NSObject

#pragma mark Public

- (id)getWithId:(jlong)id_;

- (id<DKKeyValueEngine>)getEngine;

#pragma mark Protected

- (instancetype)initWithDKKeyValueStorage:(id<DKKeyValueStorage>)collectionStorage;

- (id)createNewWithDKKeyValueItem:(id<DKKeyValueItem>)raw;

- (id)deserializeWithByteArray:(IOSByteArray *)raw;

- (IOSByteArray *)serializeWithDKKeyValueItem:(id<DKKeyValueItem>)raw;

@end

J2OBJC_EMPTY_STATIC_INIT(AMMVVMCollection)

FOUNDATION_EXPORT void AMMVVMCollection_initWithDKKeyValueStorage_(AMMVVMCollection *self, id<DKKeyValueStorage> collectionStorage);

J2OBJC_TYPE_LITERAL_HEADER(AMMVVMCollection)

typedef AMMVVMCollection ImActorModelMvvmMVVMCollection;

#endif // _AMMVVMCollection_H_
