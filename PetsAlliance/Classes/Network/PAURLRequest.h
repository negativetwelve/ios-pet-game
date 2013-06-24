//
//  PAURLRequest.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/22/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

#import "KeychainItemWrapper.h"
#import "AESCrypt.h"

@interface PAURLRequest : NSObject {
    
}

+ (id)requestWithURL:(NSString *)path method:(RKRequestMethod)method parameters:(NSDictionary *)params objectMapping:(RKMapping *)mapping keyPath:(NSString *)keyPath delegate:(id)delegate successSelector:(SEL)successSelector failureSelector:(SEL)failureSelector;

+ (void)requestWithURL:(NSString *)path method:(RKRequestMethod)method parameters:(NSDictionary *)params objectMapping:(RKMapping *)mapping keyPath:(NSString *)keyPath delegate:(id)delegate successBlock:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))successBlock failureBlock:(void (^)(RKObjectRequestOperation *operation, NSError *error))failureBlock;

@end
