//
//  Attack.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/20/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "Attack.h"

@implementation Attack

+ (RKObjectMapping *)mapping {
    RKObjectMapping *attacksMapping = [RKObjectMapping mappingForClass:[self class]];
    [attacksMapping addAttributeMappingsFromDictionary:@{
     @"encid" : @"encid",
     @"name" : @"name",
     @"pp" : @"pp",
     }];
    return attacksMapping;
}

+ (RKResponseDescriptor *)responseDescriptor {
    RKResponseDescriptor *descriptor = [RKResponseDescriptor responseDescriptorWithMapping:self.mapping pathPattern:nil keyPath:@"attacks" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return descriptor;
}

@end
