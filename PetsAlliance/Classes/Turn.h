//
//  Turn.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/21/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

#import "BattleAction.h"

@interface Turn : NSObject

@property (nonatomic, copy) NSArray *battleActions;

+ (RKObjectMapping *)mapping;
+ (RKResponseDescriptor *)responseDescriptor;

@end
