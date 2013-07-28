//
//  UserBattleStatusView.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/22/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "InBattleViewController.h"

#import "Pet.h"

@interface UserBattleStatusView : UIView {
    InBattleViewController *inBattleController;
}

@property (nonatomic, assign) InBattleViewController *inBattleController;

- (id)initWithFrame:(CGRect)frame andPet:(Pet *)pet andInBattleController:(InBattleViewController *)controller;

@end
