//
//  AttackSelectionView.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/14/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "AttackSelectionView.h"

@implementation AttackSelectionView
@synthesize inBattleController = _inBattleController;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [closeButton setFrame:CGRectMake(280, 20, 20, 20)];
        [closeButton addTarget:self action:@selector(closeButton:) forControlEvents:UIControlEventTouchUpInside];
        [closeButton setNuiClass:@"Button:XButton"];
        [closeButton setTitle:@"x" forState:UIControlStateNormal];
        [self addSubview:closeButton];
        
        UIButton *attack1Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        UIButton *attack2Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        UIButton *attack3Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        UIButton *attack4Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        if (IS_IPHONE5) {
            [attack1Button setFrame:CGRectMake(30, 44, 120, 80)];
            [attack2Button setFrame:CGRectMake(160, 44, 120, 80)];
            [attack3Button setFrame:CGRectMake(30, 148, 120, 80)];
            [attack4Button setFrame:CGRectMake(160, 148, 120, 80)];
            
            [attack1Button setNuiClass:@"Button:BattleOptionsButton"];
            [attack2Button setNuiClass:@"Button:BattleOptionsButton"];
            [attack3Button setNuiClass:@"Button:BattleOptionsButton"];
            [attack4Button setNuiClass:@"Button:BattleOptionsButton"];
        } else {
            [attack1Button setFrame:CGRectMake(30, 30, 120, 50)];
            [attack2Button setFrame:CGRectMake(160, 30, 120, 50)];
            [attack3Button setFrame:CGRectMake(30, 100, 120, 50)];
            [attack4Button setFrame:CGRectMake(160, 100, 120, 50)];
            
            [attack1Button setNuiClass:@"Button:BattleOptionsButton4"];
            [attack2Button setNuiClass:@"Button:BattleOptionsButton4"];
            [attack3Button setNuiClass:@"Button:BattleOptionsButton4"];
            [attack4Button setNuiClass:@"Button:BattleOptionsButton4"];
        }
        
        [attack1Button addTarget:self action:@selector(attack1ButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [attack2Button addTarget:self action:@selector(attack2ButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [attack3Button addTarget:self action:@selector(attack3ButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [attack4Button addTarget:self action:@selector(attack4ButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [attack1Button setTitle:@"Surf" forState:UIControlStateNormal];
        [attack2Button setTitle:@"Tackle" forState:UIControlStateNormal];
        [attack3Button setTitle:@"Attack3" forState:UIControlStateNormal];
        [attack4Button setTitle:@"Attack4" forState:UIControlStateNormal];
        
        [self addSubview:attack1Button];
        [self addSubview:attack2Button];
        [self addSubview:attack3Button];
        [self addSubview:attack4Button];
    }
    return self;
}

- (void)closeButton: (id)selector {
    NSLog(@"close button pressed");

    UIView *attackSelectionView = ((UIButton *)selector).superview;
    BattleOptionsView *battleOptionsView = [[BattleOptionsView alloc] initWithFrame:attackSelectionView.frame];
    [battleOptionsView setInBattleController:self.inBattleController];

    UIView *containerView = attackSelectionView.superview;
    [UIView transitionWithView:containerView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{ [attackSelectionView removeFromSuperview]; [containerView addSubview:battleOptionsView]; }
                    completion:NULL];
}

- (void)attack1ButtonPressed: (id)selector {
    NSLog(@"attack 1 button pressed");
    //UIView *attackSelectionView = ((UIButton *)selector).superview;

    float delay = [AttackAnimationManager mainAttack:@"surf" forView:self.inBattleController.animationView withFrames:7];
    [AttackAnimationManager performSelector:@selector(flicker:) withObject:self.inBattleController.topPet afterDelay:delay];

    [self.inBattleController changeHPBy:50 forPet:@"top"];
}

- (void)attack2ButtonPressed: (id)selector {
    NSLog(@"attack 2 button pressed");
    //UIView *attackSelectionView = ((UIButton *)selector).superview;

    float delay = [AttackAnimationManager movementAttack:@"tackle" forPet:self.inBattleController.bottomPet];
    [AttackAnimationManager performSelector:@selector(flicker:) withObject:self.inBattleController.topPet afterDelay:delay];
}

- (void)attack3ButtonPressed: (id)selector {
    NSLog(@"attack 3 button pressed");
    //UIView *attackSelectionView = ((UIButton *)selector).superview;
}

- (void)attack4ButtonPressed: (id)selector {
    NSLog(@"attack 4 button pressed");
    //UIView *attackSelectionView = ((UIButton *)selector).superview;
}

@end
