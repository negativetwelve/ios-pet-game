//
//  User.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/17/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSNumber *userID;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSNumber *money;
@property (nonatomic, copy) NSNumber *bank;
@property (nonatomic, copy) NSNumber *moneyRate;
@property (nonatomic, copy) NSNumber *skillLevel;

@end
