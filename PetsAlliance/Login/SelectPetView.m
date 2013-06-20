//
//  SelectPetView.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/19/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "SelectPetView.h"

@implementation SelectPetView
@synthesize index;
@synthesize viewController = _viewController;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.nuiClass = @"DefaultView";

        UIImageView *character = [[UIImageView alloc] initWithFrame:CGRectMake(120, 120, 80, 120)];
        [character setImage:[UIImage imageNamed:@"male.png"]];
        [self addSubview:character];
        
        UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [selectButton setTitle:@"Select!" forState:UIControlStateNormal];
        [selectButton setNuiClass:@"Button:LargeButton"];
        [selectButton setFrame:CGRectMake(70, 400, 180, 50)];
        [selectButton addTarget:self.viewController action:@selector(selectPetAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:selectButton];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andIndex:(int)inputIndex {
    self = [self initWithFrame:frame];
    self.index = inputIndex;
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
