//
//  BattleAction.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/21/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "BattleAction.h"

@implementation BattleAction

+ (RKObjectMapping *)mapping {
    RKObjectMapping *battleActionMapping = [RKObjectMapping mappingForClass:[self class]];
    [battleActionMapping addAttributeMappingsFromDictionary:@{
     @"owner_type" : @"ownerType",
     @"type" : @"type",
     @"attack_id" : @"attackId",
     @"pet_damage" : @"petDamage",
     @"opponent_pet_damage" : @"opponentPetDamage",
     @"pet_status_id" : @"petStatusId",
     @"opponent_pet_status_id" : @"opponentPetStatusId",
     @"battle_finished" : @"battleFinished",
     @"run_successful" : @"runSuccessful",
     @"item_id" : @"itemId",
     @"item_target_id" : @"itemTargetId",
     @"switch_to_pet_id" : @"switchToPetId",
     }];
    return battleActionMapping;
}

+ (RKResponseDescriptor *)responseDescriptor {
    RKResponseDescriptor *descriptor = [RKResponseDescriptor responseDescriptorWithMapping:self.mapping pathPattern:nil keyPath:@"battleActions" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return descriptor;
}

@end
