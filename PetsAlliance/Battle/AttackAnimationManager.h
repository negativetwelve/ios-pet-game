//
//  AttackAnimationManager.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/11/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AttackAnimationManager : NSObject

+ (void)faint:(UIImageView *)petImage;
+ (void)flicker:(UIImageView *)petImage;
+ (void)mainAttack:(NSString *)attack forView:(UIView *)view withFrames:(int)num withDelay:(float)delay;
+ (float)movementAttack:(NSString *)attack forPet:(UIImageView *)pet withDelay:(float)delay;

@end
