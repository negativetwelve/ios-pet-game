//
//  User.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/17/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "User.h"

@implementation User

+ (RKObjectMapping *)mapping {
    RKObjectMapping *userMapping = [RKObjectMapping mappingForClass:[self class]];
    [userMapping addAttributeMappingsFromDictionary:@{
     @"username" : @"username",
     @"character" : @"character",
     @"money" : @"money",
     @"money_rate" : @"moneyRate",
     @"bank" : @"bank",
     @"energy" : @"energy",
     @"energy_rate" : @"energyRate",
     @"skill_level" : @"skillLevel",
     }];
    return userMapping;
}

+ (RKResponseDescriptor *)responseDescriptor {
    RKResponseDescriptor *descriptor = [RKResponseDescriptor responseDescriptorWithMapping:self.mapping pathPattern:nil keyPath:@"user" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return descriptor;
}

@end
