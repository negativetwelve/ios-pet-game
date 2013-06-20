//
//  SelectPetView.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/19/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIButton+NUI.h"
#import "UILabel+NUI.h"
#import "UITextField+NUI.h"
#import "FirstPetViewController.h"

@class FirstPetViewController;
@interface SelectPetView : UIView {
    FirstPetViewController *viewController;
    int index;
}

@property (nonatomic, assign) FirstPetViewController *viewController;
@property (nonatomic, assign) int index;

- (id) initWithFrame:(CGRect)frame andIndex:(int)index;

@end
