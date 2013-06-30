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
@synthesize name;
@synthesize viewController = _viewController;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.nuiClass = @"DefaultView";

        UIImageView *character = [[UIImageView alloc] initWithFrame:CGRectMake(120, 120, 80, 120)];
        [character setImage:[UIImage imageNamed:@"dragon.png"]];
        [self addSubview:character];
        
        UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [selectButton setTitle:@"Select!" forState:UIControlStateNormal];
        [selectButton setNuiClass:@"Button:LargeButton"];
        [selectButton setFrame:CGRectMake(70, 340, 180, 50)];
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

- (id) initWithFrame:(CGRect)frame andIndex:(int)inputIndex andName:(NSString *)inputName {
    self = [super initWithFrame:frame];
    if (self) {
        self.nuiClass = @"DefaultView";
        
        UIImageView *character = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
        NSLog(@"%@.png", inputName);
        [character setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", inputName]]];
        [self addSubview:character];
        
        UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [selectButton setTitle:@"Select!" forState:UIControlStateNormal];
        [selectButton setNuiClass:@"Button:LargeButton"];
        [selectButton setFrame:CGRectMake(70, 340, 180, 50)];
        [selectButton addTarget:self.viewController action:@selector(selectPetAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:selectButton];
    }
    self.index = inputIndex;
    self.name = inputName;
    return self;
}

@end
