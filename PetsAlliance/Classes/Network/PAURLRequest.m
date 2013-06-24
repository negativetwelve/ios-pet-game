//
//  PAURLRequest.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/22/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "PAURLRequest.h"

NSString *const kEncryptionKey = @"IQPRZUDGWWCGVGHTKHRPEQAYPPAQXASH";

@implementation PAURLRequest

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

+ (id)requestWithURL:(NSString *)path method:(RKRequestMethod)method parameters:(NSDictionary *)params objectMapping:(RKMapping *)mapping keyPath:(NSString *)keyPath delegate:(id)delegate successSelector:(SEL)successSelector failureSelector:(SEL)failureSelector {
    PAURLRequest *request = [[PAURLRequest init] alloc];
    if ([request _requestWithURL:path method:method object:nil parameters:params objectMapping:mapping keyPath:keyPath delegate:delegate successSelector:successSelector failureSelector:failureSelector]) {
        return request;
    }
    return nil;
}

+ (void)requestWithURL:(NSString *)path method:(RKRequestMethod)method parameters:(NSDictionary *)params objectMapping:(RKMapping *)mapping keyPath:(NSString *)keyPath delegate:(id)delegate successBlock:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))successBlock failureBlock:(void (^)(RKObjectRequestOperation *operation, NSError *error))failureBlock {
    [PAURLRequest _requestWithURL:path method:method object:nil parameters:params objectMapping:mapping keyPath:keyPath delegate:delegate successBlock:successBlock failureBlock:failureBlock];
}

+ (void)_requestWithURL:(NSString *)path method:(RKRequestMethod)method object:(NSObject *)obj parameters:(NSDictionary *)params objectMapping:(RKMapping *)mapping keyPath:(NSString *)keyPath delegate:(id)delegate successBlock:(void (^)())successBlock failureBlock:(void (^)())failureBlock {
    
    RKObjectManager *manager = [RKObjectManager sharedManager];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping pathPattern:nil keyPath:keyPath statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];

    NSMutableURLRequest *request = [manager requestWithObject:obj method:method path:path parameters:params];
    
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ responseDescriptor ]];
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        successBlock(operation, mappingResult);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(operation, error);
    }];
    
    [manager enqueueObjectRequestOperation:objectRequestOperation];
}

- (BOOL)_requestWithURL:(NSString *)path method:(RKRequestMethod)method object:(NSObject *)obj parameters:(NSDictionary *)params objectMapping:(RKMapping *)mapping keyPath:(NSString *)keyPath delegate:(id)delegate successSelector:(SEL)successSelector failureSelector:(SEL)failureSelector {

    RKObjectManager *manager = [RKObjectManager sharedManager];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping pathPattern:nil keyPath:keyPath statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    NSMutableURLRequest *request = [manager requestWithObject:obj method:method path:path parameters:params];
    
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ responseDescriptor ]];
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        [delegate performSelector:successSelector withObject:[mappingResult array]];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [delegate performSelector:failureSelector withObject:error];
    }];
    
    [manager enqueueObjectRequestOperation:objectRequestOperation];
    return YES;
}


@end
