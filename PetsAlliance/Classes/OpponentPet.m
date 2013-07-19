//
//  OpponentPet.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/19/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "OpponentPet.h"

@implementation OpponentPet

+ (RKObjectMapping *)mapping {
    RKObjectMapping *opponentPetMapping = [RKObjectMapping mappingForClass:[self class]];
    [opponentPetMapping addAttributeMappingsFromDictionary:@{
     @"name" : @"name",
     @"level" : @"level",
     @"attack" : @"attack",
     @"special_attack" : @"specialAttack",
     @"defense" : @"defense",
     @"special_defense" : @"specialDefense",
     @"speed" : @"speed",
     @"curr_hp" : @"currHp",
     @"max_hp" : @"maxHp",
     }];
    return opponentPetMapping;
}

+ (RKResponseDescriptor *)responseDescriptor {
    RKResponseDescriptor *descriptor = [RKResponseDescriptor responseDescriptorWithMapping:self.mapping pathPattern:nil keyPath:@"opponent_pets" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return descriptor;
}

@end
