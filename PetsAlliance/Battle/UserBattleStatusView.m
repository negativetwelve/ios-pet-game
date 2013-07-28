//
//  UserBattleStatusView.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/22/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "UserBattleStatusView.h"

@implementation UserBattleStatusView
@synthesize inBattleController = _inBattleController;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andPet:(Pet *)pet andInBattleController:(InBattleViewController *)controller {
    self = [self initWithFrame:frame];
    
    if (self) {
        [self setInBattleController:controller];
        [self setNuiClass:@"BattleStatusView"];
        
        UIProgressView *bottomCharProgressBar = [[UIProgressView alloc] initWithFrame:CGRectMake(10, 10, 80, 5)];
        [bottomCharProgressBar setProgress:[pet.currHp floatValue] / [pet.maxHp floatValue]];
        
        if (bottomCharProgressBar.progress > 0.5) {
            [bottomCharProgressBar setNuiClass:@"HPBarGreen"];
        } else if (bottomCharProgressBar.progress > 0.25) {
            [bottomCharProgressBar setNuiClass:@"HPBarOrange"];
        } else {
            [bottomCharProgressBar setNuiClass:@"HPBarRed"];
        }
        
        [self addSubview:bottomCharProgressBar];
        [self.inBattleController setBottomCharBar:bottomCharProgressBar];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
