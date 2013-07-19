//
//  Opponent.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/17/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

#import "OpponentPet.h"

@interface Opponent : NSObject

@property (nonatomic, copy) NSNumber *encid;

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *character;
@property (nonatomic, copy) NSNumber *money;
@property (nonatomic, copy) NSNumber *moneyRate;
@property (nonatomic, copy) NSNumber *bank;
@property (nonatomic, copy) NSNumber *energy;
@property (nonatomic, copy) NSNumber *energyRate;
@property (nonatomic, copy) NSNumber *skillLevel;

@property (nonatomic, copy) NSArray *opponentPets;

+ (RKObjectMapping *)mapping;
+ (RKResponseDescriptor *)responseDescriptor;

@end
