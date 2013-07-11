//
//  AttackAnimationManager.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/11/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "AttackAnimationManager.h"

@implementation AttackAnimationManager

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

+ (float)mainAttack:(NSString *)attack forView:(UIView *)view withFrames:(int)num {
    NSMutableArray *animationArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < num; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_%d.png", attack, i + 1]];
        if (image) {
            [animationArray addObject:image];
        }
    }
    UIImageView *animationView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 280)];
    animationView.animationImages = animationArray;
    animationView.animationDuration = 2.0;
    animationView.animationRepeatCount = 1;
    [animationView startAnimating];
    [view addSubview:animationView];
    
    return animationView.animationDuration + 0.3;
}

+ (float)movementAttack:(NSString *)attack forView:(UIImageView *)view {
    if ([attack isEqualToString:@"tackle"]) {
        return [self tackleForPet:view];
    }
    
    return 0;
}

+ (float)tackleForPet:(UIImageView *)petImage {
    float delay = 0.3;
    [UIView animateWithDuration:delay delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        petImage.transform = CGAffineTransformMakeTranslation(70, -70);
    } completion:^(BOOL finished) {
        petImage.transform = CGAffineTransformIdentity;
    }];

    return delay;
}

@end
