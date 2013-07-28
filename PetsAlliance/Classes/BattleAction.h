//
//  BattleAction.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/21/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface BattleAction : NSObject

@property (nonatomic, copy) NSString *ownerType;
@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSNumber *attackId;
@property (nonatomic, copy) NSNumber *petDamage;
@property (nonatomic, copy) NSNumber *opponentPetDamage;
@property (nonatomic, copy) NSNumber *petStatusId;
@property (nonatomic, copy) NSNumber *opponentPetStatusId;
@property (nonatomic, assign) bool battleFinished;

@property (nonatomic, assign) bool runSuccessful;

@property (nonatomic, copy) NSNumber *itemId;
@property (nonatomic, copy) NSNumber *itemTargetId;

@property (nonatomic, copy) NSNumber *switchToPetId;

+ (RKObjectMapping *)mapping;
+ (RKResponseDescriptor *)responseDescriptor;

@end
