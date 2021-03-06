//
//  MKitServiceManager.m
//  ModelKit
//
//  Created by Jon Gilkison on 10/29/12.
//  Copyright (c) 2012 Interfacelab LLC. All rights reserved.
//

#import "MKitServiceManager.h"
#import "MKitServiceModelQuery.h"
#import "MKitServiceUser.h"
#import "MKitServiceModel.h"

@implementation MKitServiceManager

@synthesize keychain;

static NSMutableDictionary *managers=nil;

+(MKitServiceManager *)setupService:(NSString *)name withKeys:(NSDictionary *)keys
{
    if (!managers)
        managers=[[NSMutableDictionary dictionary] retain];
    
    MKitServiceManager *m=[managers objectForKey:name];
    if (m)
        [managers removeObjectForKey:m];
    
    Class serviceClass=NSClassFromString([NSString stringWithFormat:@"MKit%@ServiceManager",name]);
    if (!serviceClass)
        @throw [NSException exceptionWithName:@"Service Not Found" reason:[NSString stringWithFormat:@"Service named '%@' could not be found.",name] userInfo:nil];
    
    m=[[serviceClass alloc] initWithKeys:keys];
    [managers setObject:m forKey:name];
    return m;
}

+(MKitServiceManager *)managerForService:(NSString *)name;
{
    if (!managers)
        managers=[[NSMutableDictionary dictionary] retain];
    
    return [managers objectForKey:name];
}

-(id)initWithKeys:(NSDictionary *)keys
{
    if ((self=[super init]))
    {
        keychain=nil;
    }
    
    return self;
}

#pragma mark - Query

-(MKitServiceModelQuery *)queryForModelClass:(Class)modelClass
{
    return nil;
}

#pragma mark - Model

-(BOOL)saveModel:(MKitModel *)model error:(NSError **)error
{
    return NO;
}

-(void)saveModelInBackground:(MKitModel *)model withBlock:(MKitBooleanResultBlock)resultBlock
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSError *error=nil;
        BOOL result=[self saveModel:model error:&error];
        if (resultBlock)
            resultBlock(result,error);
    });
}

-(BOOL)deleteModel:(MKitModel *)model error:(NSError **)error
{
    return NO;
}

-(void)deleteModelInBackground:(MKitModel *)model withBlock:(MKitBooleanResultBlock)resultBlock
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSError *error=nil;
        BOOL result=[self deleteModel:model error:&error];
        if (resultBlock)
            resultBlock(result,error);
    });
}

-(BOOL)fetchModel:(MKitModel *)model error:(NSError **)error
{
    return NO;
}

-(void)fetchModelInBackground:(MKitModel *)model withBlock:(MKitBooleanResultBlock)resultBlock
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSError *error=nil;
        BOOL result=[self fetchModel:model error:&error];
        if (resultBlock)
            resultBlock(result,error);
    });
}

#pragma mark - Request generation

-(AFHTTPRequestOperation *)classRequestWithMethod:(NSString *)method class:(Class)class params:(NSDictionary *)params body:(NSData *)body
{
    return nil;
}

-(AFHTTPRequestOperation *)modelRequestWithMethod:(NSString *)method model:(MKitModel *)model params:(NSDictionary *)params body:(NSData *)body
{
    return nil;
}

-(AFHTTPRequestOperation *)requestWithMethod:(NSString *)method path:(NSString *)path params:(NSDictionary *)params body:(NSData *)body contentType:(NSString *)contentType
{
    return nil;
}

#pragma mark - Credentials

-(NSDictionary *)userCredentials
{
    return nil;
}

-(void)storeUserCredentials:(MKitServiceModel<MKitServiceUser> *)user
{
    
}

#pragma mark - File

-(BOOL)saveFile:(MKitServiceFile *)file progressBlock:(MKitProgressBlock)progressBlock error:(NSError **)error
{
    return NO;
}

-(void)saveFileInBackground:(MKitServiceFile *)file progressBlock:(MKitProgressBlock)progressBlock resultBlock:(MKitBooleanResultBlock)resultBlock
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSError *error=nil;
        BOOL result=[self saveFile:file progressBlock:progressBlock error:&error];
        if (resultBlock)
            resultBlock(result,error);
    });
}

-(BOOL)deleteFile:(MKitServiceFile *)file error:(NSError **)error
{
    return NO;
}

-(void)deleteFileInBackground:(MKitServiceFile *)file withBlock:(MKitBooleanResultBlock)resultBlock
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSError *error=nil;
        BOOL result=[self deleteFile:file error:&error];
        if (resultBlock)
            resultBlock(result,error);
    });
}

@end
