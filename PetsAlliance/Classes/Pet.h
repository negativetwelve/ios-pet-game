//
//  Pet.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/17/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "User.h"

@interface Pet : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *level;
@property (nonatomic, copy) NSNumber *attack;
@property (nonatomic, copy) NSNumber *defense;
@property (nonatomic, copy) NSNumber *specialAttack;
@property (nonatomic, copy) NSNumber *specialDefense;
@property (nonatomic, copy) NSNumber *speed;
@property (nonatomic, copy) NSNumber *experience;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSMutableArray *types;

+ (RKObjectMapping *)mapping;
+ (RKResponseDescriptor *)responseDescriptor;

@end
