//
//  Success.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/30/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "Success.h"

@implementation Success

+ (RKObjectMapping *)mapping {
    RKObjectMapping *successMapping = [RKObjectMapping mappingForClass:[self class]];
    [successMapping addAttributeMappingsFromDictionary:@{
     @"reason" : @"reason",
     @"code" : @"code",
     }];
    return successMapping;
}

+ (RKResponseDescriptor *)responseDescriptor {
    RKResponseDescriptor *descriptor = [RKResponseDescriptor responseDescriptorWithMapping:self.mapping pathPattern:nil keyPath:@"success" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return descriptor;
}

@end
