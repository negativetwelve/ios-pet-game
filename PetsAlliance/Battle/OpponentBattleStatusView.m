//
//  OpponentBattleStatusView.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/22/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "OpponentBattleStatusView.h"

@implementation OpponentBattleStatusView
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
        
        UIProgressView *topCharProgressBar = [[UIProgressView alloc] initWithFrame:CGRectMake(10, 10, 80, 5)];
        [topCharProgressBar setProgress:[pet.currHp floatValue] / [pet.maxHp floatValue]];
        
        if (topCharProgressBar.progress > 0.5) {
            [topCharProgressBar setNuiClass:@"HPBarGreen"];
        } else if (topCharProgressBar.progress > 0.25) {
            [topCharProgressBar setNuiClass:@"HPBarOrange"];
        } else {
            [topCharProgressBar setNuiClass:@"HPBarRed"];
        }
        
        [self addSubview:topCharProgressBar];
        [self.inBattleController setTopCharBar:topCharProgressBar];
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
