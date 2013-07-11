//
//  AttackAnimationManager.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/11/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AttackAnimationManager : NSObject

+ (void)flicker:(UIImageView *)petImage;
+ (float)mainAttack:(NSString *)attack forView:(UIView *)view withFrames:(int)num;
+ (float)movementAttack:(NSString *)attack forView:(UIView *)view;

@end
