//
//  AttackAnimationManager.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/11/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "AttackAnimationManager.h"

@implementation AttackAnimationManager


+ (float)movementAttack:(NSString *)attack forPet:(UIImageView *)pet withDelay:(float)delay {
    if ([attack isEqualToString:@"tackle"]) {
        [AttackAnimationManager performSelector:@selector(tackleWithPet:) withObject:pet afterDelay:delay];
    }
    
    return 0;
}

+ (void)mainAttack:(NSString *)attack forView:(UIView *)view withFrames:(int)num withDelay:(float)delay {
    NSMutableArray *animationArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < num; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_%d.png", attack, i + 1]];
        if (image) {
            [animationArray addObject:image];
        }
    }
    [AttackAnimationManager performSelector:@selector(animationAttack:) withObject:@{@"animationArray": animationArray, @"view": view} afterDelay:delay];
}

+ (void)animationAttack:(NSDictionary *)params {
    UIImageView *animationView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 280)];
    animationView.animationImages = [params objectForKey:@"animationArray"];
    animationView.animationDuration = 2.0;
    animationView.animationRepeatCount = 1;
    [animationView startAnimating];
    [[params objectForKey:@"view"] addSubview:animationView];
}

+ (void)flicker:(UIImageView *)petImage {
    NSLog(@"flickering");
    [UIView animateWithDuration:0.1 animations:^{
        petImage.alpha = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.05 animations:^{
            petImage.alpha = 1;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.05 animations:^{
                petImage.alpha = 0;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 animations:^{
                    petImage.alpha = 1;
                } completion:^(BOOL finished) {
                    
                }];
            }];
        }];
    }];
}

+ (void)faint:(UIImageView *)petImage {
    [UIView animateWithDuration:0.5 animations:^{
        petImage.transform = CGAffineTransformMakeTranslation(0, 320);
    } completion:^(BOOL finished) {

    }];
}

+ (void)tackleWithPet:(UIImageView *)petImage {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        petImage.transform = CGAffineTransformMakeTranslation(70, -70);
    } completion:^(BOOL finished) {
        petImage.transform = CGAffineTransformIdentity;
    }];
}

@end
