//
//  OpponentPet.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/19/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Opponent.h"

@class Opponent;
@interface OpponentPet : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *level;
@property (nonatomic, copy) NSNumber *attack;
@property (nonatomic, copy) NSNumber *defense;
@property (nonatomic, copy) NSNumber *specialAttack;
@property (nonatomic, copy) NSNumber *specialDefense;
@property (nonatomic, copy) NSNumber *speed;
@property (nonatomic, copy) NSNumber *currHp;
@property (nonatomic, copy) NSNumber *maxHp;

@property (nonatomic, strong) Opponent *opponent;
@property (nonatomic, strong) NSMutableArray *types;

+ (RKObjectMapping *)mapping;
+ (RKResponseDescriptor *)responseDescriptor;

@end
