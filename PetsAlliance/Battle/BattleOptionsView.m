//
//  BattleOptionsView.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/14/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "BattleOptionsView.h"

@implementation BattleOptionsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton *attackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        UIButton *switchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        UIButton *itemsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        UIButton *runButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        if (IS_IPHONE5) {
            [attackButton setFrame:CGRectMake(30, 44, 120, 80)];
            [switchButton setFrame:CGRectMake(160, 44, 120, 80)];
            [itemsButton setFrame:CGRectMake(30, 148, 120, 80)];
            [runButton setFrame:CGRectMake(160, 148, 120, 80)];
        } else {
            [attackButton setFrame:CGRectMake(30, 30, 120, 50)];
            [switchButton setFrame:CGRectMake(160, 30, 120, 50)];
            [itemsButton setFrame:CGRectMake(30, 100, 120, 50)];
            [runButton setFrame:CGRectMake(160, 100, 120, 50)];
        }
        
        [attackButton addTarget:self action:@selector(attackButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [switchButton addTarget:self action:@selector(switchButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [itemsButton addTarget:self action:@selector(itemsButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [runButton addTarget:self action:@selector(runButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [attackButton setTitle:@"Attack" forState:UIControlStateNormal];
        [switchButton setTitle:@"Switch" forState:UIControlStateNormal];
        [itemsButton setTitle:@"Items" forState:UIControlStateNormal];
        [runButton setTitle:@"Run" forState:UIControlStateNormal];
        
        [self addSubview:attackButton];
        [self addSubview:switchButton];
        [self addSubview:itemsButton];
        [self addSubview:runButton];
        
    }
    return self;
}

- (void)attackButtonPressed: (id)selector {
    NSLog(@"attack button pressed");
    UIView *battleOptionsView = ((UIButton *)selector).superview;
    AttackSelectionView *attackSelectionView = [[AttackSelectionView alloc] initWithFrame:battleOptionsView.frame];

    UIView *containerView = battleOptionsView.superview;
    [UIView transitionWithView:containerView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{ [battleOptionsView removeFromSuperview]; [containerView addSubview:attackSelectionView]; }
                    completion:NULL];
}

- (void)switchButtonPressed: (id)selector {
    NSLog(@"switch button pressed");
}

- (void)itemsButtonPressed: (id)selector {
    NSLog(@"items button pressed");
}

- (void)runButtonPressed: (id)selector {
    NSLog(@"run button pressed");
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
