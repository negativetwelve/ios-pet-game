//
//  Opponent.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/17/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "Opponent.h"

@implementation Opponent

+ (RKObjectMapping *)mapping {
    RKObjectMapping *opponentMapping = [RKObjectMapping mappingForClass:[self class]];
    [opponentMapping addAttributeMappingsFromDictionary:@{
     @"encid" : @"encid",
     @"username" : @"username",
     @"character" : @"character",
     @"money" : @"money",
     @"money_rate" : @"moneyRate",
     @"bank" : @"bank",
     @"energy" : @"energy",
     @"energy_rate" : @"energyRate",
     @"skill_level" : @"skillLevel",
     
     }];
    [opponentMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"opponent_pets" toKeyPath:@"opponentPets" withMapping:OpponentPet.mapping]];
    return opponentMapping;
}

+ (RKResponseDescriptor *)responseDescriptor {
    RKResponseDescriptor *descriptor = [RKResponseDescriptor responseDescriptorWithMapping:self.mapping pathPattern:nil keyPath:@"opponent" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return descriptor;
}

@end
