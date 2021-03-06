//
//  MKitModelRegistry.m
//  ModelKit
//
//  Created by Jon Gilkison on 10/25/12.
//  Copyright (c) 2012 Interfacelab LLC. All rights reserved.
//

#import "MKitModelRegistry.h"

@implementation MKitModelRegistry

static NSMutableDictionary *registry=nil;


+(void)registerModel:(NSString *)modelName forClass:(Class)class
{
    if (!registry)
        registry=[[NSMutableDictionary alloc] init];
    
    [registry setObject:class forKey:modelName];
}

+(Class)registeredClassForModel:(NSString *)modelName
{
    if (!registry)
        return nil;
    
    return [registry objectForKey:modelName];
}

@end
