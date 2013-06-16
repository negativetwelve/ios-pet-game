//
//  RunSelectionView.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/14/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "RunSelectionView.h"

@implementation RunSelectionView
@synthesize inBattleController = _inBattleController;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *yesButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        UIButton *noButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

        if (IS_IPHONE5) {
            [yesButton setFrame:CGRectMake(40, 100, 100, 60)];
            [noButton setFrame:CGRectMake(180, 100, 100, 60)];
            
            [yesButton setNuiClass:@"Button:ConfirmButton:RunOptionsButton"];
            [noButton setNuiClass:@"Button:DenyButton:RunOptionsButton"];
        } else {
            [yesButton setFrame:CGRectMake(40, 70, 100, 40)];
            [noButton setFrame:CGRectMake(180, 70, 100, 40)];
            
            [yesButton setNuiClass:@"Button:ConfirmButton:RunOptionsButton4"];
            [noButton setNuiClass:@"Button:DenyButton:RunOptionsButton4"];
        }
        
        [yesButton addTarget:self action:@selector(yesButton:) forControlEvents:UIControlEventTouchUpInside];
        [noButton addTarget:self action:@selector(noButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [yesButton setTitle:@"Yes" forState:UIControlStateNormal];
        [noButton setTitle:@"No" forState:UIControlStateNormal];

        [self addSubview:yesButton];
        [self addSubview:noButton];
    }
    return self;
}

- (void)noButton: (id)selector {
    NSLog(@"no button pressed");
    
    UIView *runSelectionView = ((UIButton *)selector).superview;
    BattleOptionsView *battleOptionsView = [[BattleOptionsView alloc] initWithFrame:runSelectionView.frame];
    [battleOptionsView setInBattleController:self.inBattleController];

    UIView *containerView = runSelectionView.superview;
    [UIView transitionWithView:containerView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{ [runSelectionView removeFromSuperview]; [containerView addSubview:battleOptionsView]; }
                    completion:NULL];
}

- (void)yesButton: (id)selector {
    NSLog(@"yes button pressed");
    
    [self.inBattleController dismissViewControllerAnimated:YES completion:nil];
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
