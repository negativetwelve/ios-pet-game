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
     @"encid" : @"encid",
     @"in_battle" : @"inBattle",
     @"username" : @"username",
     @"character" : @"character",
     @"money" : @"money",
     @"money_rate" : @"moneyRate",
     @"bank" : @"bank",
     @"energy" : @"energy",
     @"energy_rate" : @"energyRate",
     
     @"wins" : @"wins",
     @"losses" : @"losses",
     @"passive_wins" : @"passiveWins",
     @"passive_losses" : @"passiveLosses",
     @"run_aways" : @"runAways",
     @"passive_run_aways" : @"passiveRunAways",
     
     @"skill_level" : @"skillLevel",
     }];
    [userMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user_pets" toKeyPath:@"userPets" withMapping:Pet.mapping]];
    return userMapping;
}

+ (RKResponseDescriptor *)userResponseDescriptor {
    RKResponseDescriptor *descriptor = [RKResponseDescriptor responseDescriptorWithMapping:self.mapping pathPattern:nil keyPath:@"user" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return descriptor;
}

+ (RKResponseDescriptor *)usersResponseDescriptor {
    RKResponseDescriptor *descriptor = [RKResponseDescriptor responseDescriptorWithMapping:self.mapping pathPattern:nil keyPath:@"users" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return descriptor;
}

@end
