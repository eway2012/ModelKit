//
//  COModelRegistry.h
//  CloudObject
//
//  Created by Jon Gilkison on 10/25/12.
//  Copyright (c) 2012 Interfacelab LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Registers a model's name with its class for mapping.  COModel automatically does this for you
 * if you override the modelName property with your own.
 */
@interface COModelRegistry : NSObject

/**
 * Registers a model's class name for its class
 * @param modelName The name of the model
 * @param class The class to map to
 */
+(void)registerModel:(NSString *)modelName forClass:(Class)class;

/**
 * Retrieves the registered class for a given model
 * @param modelName The name of the model to retrieve
 */
+(Class)registeredClassForModel:(NSString *)modelName;

@end
