//
//  Battle.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/16/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "Battle.h"

@implementation Battle

+ (RKObjectMapping *)mapping {
    RKObjectMapping *battleMapping = [RKObjectMapping mappingForClass:[self class]];
    [battleMapping addAttributeMappingsFromDictionary:@{
     @"encid" : @"encid",
     @"finished" : @"finished",
     @"winner_id" : @"winnerId",
     @"loser_id" : @"loserId",
     @"money_transferred" : @"moneyTransferred",
     }];
    [battleMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"opponent" toKeyPath:@"opponent" withMapping:Opponent.mapping]];
    [battleMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user" toKeyPath:@"user" withMapping:User.mapping]];
    return battleMapping;
}

+ (RKResponseDescriptor *)responseDescriptor {
    RKResponseDescriptor *descriptor = [RKResponseDescriptor responseDescriptorWithMapping:self.mapping pathPattern:nil keyPath:@"battle" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return descriptor;
}

@end
