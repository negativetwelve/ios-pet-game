//
//  InBattleViewController.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/14/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MMViewController.h"

#import "BattleAnimationView.h"
#import "BattleOptionsView.h"
#import "PetSelectionView.h"
#import "AttackSelectionView.h"
#import "RunSelectionView.h"

#import "User.h"


@interface InBattleViewController : MMViewController {
    BattleAnimationView *animationView;
    UIImageView *topPet;
    UIImageView *bottomPet;
    User *opponent;
    User *user;
    
    UIView *topHPBar;
    UIView *bottomHPBar;
}

@property (nonatomic, retain) BattleAnimationView *animationView;
@property (nonatomic, retain) UIImageView *topPet;
@property (nonatomic, retain) UIImageView *bottomPet;
@property (nonatomic, retain) User *opponent;
@property (nonatomic, retain) User *user;

@property (nonatomic, retain) UIView *topHPBar;
@property (nonatomic, retain) UIView *bottomHPBar;

- (void)changeHPBy:(int)amount forPet:(NSString *)pet;

@end
