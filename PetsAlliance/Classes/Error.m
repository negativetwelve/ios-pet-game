//
//  Error.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/30/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "Error.h"

@implementation Error

+ (RKObjectMapping *)mapping {
    RKObjectMapping *errorMapping = [RKObjectMapping mappingForClass:[self class]];
    [errorMapping addAttributeMappingsFromDictionary:@{
     @"reason" : @"reason",
     @"code" : @"code",
     }];
    return errorMapping;
}

+ (RKResponseDescriptor *)responseDescriptor {
    RKResponseDescriptor *descriptor = [RKResponseDescriptor responseDescriptorWithMapping:self.mapping pathPattern:nil keyPath:@"error" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError)];
    return descriptor;
}

@end
