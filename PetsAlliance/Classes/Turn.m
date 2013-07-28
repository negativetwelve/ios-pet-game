//
//  Turn.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/21/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "Turn.h"

@implementation Turn

+ (RKObjectMapping *)mapping {
    RKObjectMapping *turnMapping = [RKObjectMapping mappingForClass:[self class]];
    [turnMapping addAttributeMappingsFromDictionary:@{

     }];
    [turnMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"battle_actions" toKeyPath:@"battleActions" withMapping:BattleAction.mapping]];
    return turnMapping;
}

+ (RKResponseDescriptor *)responseDescriptor {
    RKResponseDescriptor *descriptor = [RKResponseDescriptor responseDescriptorWithMapping:self.mapping pathPattern:nil keyPath:@"turn" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return descriptor;
}

@end
