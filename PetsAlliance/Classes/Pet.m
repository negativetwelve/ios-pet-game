//
//  Pet.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/17/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "Pet.h"

@implementation Pet

+ (RKObjectMapping *)mapping {
    RKObjectMapping *petMapping = [RKObjectMapping mappingForClass:[self class]];
    [petMapping addAttributeMappingsFromDictionary:@{
     @"name" : @"name",
     @"level" : @"level",
     @"experience" : @"experience",
     @"attack" : @"attack",
     @"special_attack" : @"specialAttack",
     @"defense" : @"defense",
     @"special_defense" : @"specialDefense",
     @"speed" : @"speed",
     @"curr_hp" : @"currHp",
     @"max_hp" : @"maxHp",
     }];
    [petMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"attacks" toKeyPath:@"attacks" withMapping:Attack.mapping]];
    return petMapping;
}

+ (RKResponseDescriptor *)responseDescriptor {
    RKResponseDescriptor *descriptor = [RKResponseDescriptor responseDescriptorWithMapping:self.mapping pathPattern:nil keyPath:@"pets" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return descriptor;
}

@end
