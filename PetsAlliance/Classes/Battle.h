//
//  Battle.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/16/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "User.h"
#import "Opponent.h"

@interface Battle : NSObject

@property (nonatomic, copy) NSNumber *encid;
@property (nonatomic, assign) bool finished;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) Opponent *opponent;
@property (nonatomic, copy) NSNumber *winnerId;
@property (nonatomic, copy) NSNumber *loserId;
@property (nonatomic, copy) NSNumber *moneyTransferred;

+ (RKObjectMapping *)mapping;
+ (RKResponseDescriptor *)responseDescriptor;

@end
