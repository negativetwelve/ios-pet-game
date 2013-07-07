//
//  User.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/17/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

#import "Pet.h"

@interface User : NSObject

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *character;
@property (nonatomic, copy) NSNumber *money;
@property (nonatomic, copy) NSNumber *moneyRate;
@property (nonatomic, copy) NSNumber *bank;
@property (nonatomic, copy) NSNumber *energy;
@property (nonatomic, copy) NSNumber *energyRate;
@property (nonatomic, copy) NSNumber *skillLevel;
@property (nonatomic, copy) NSArray *userPets;

+ (RKObjectMapping *)mapping;
+ (RKResponseDescriptor *)usersResponseDescriptor;
+ (RKResponseDescriptor *)userResponseDescriptor;

@end
