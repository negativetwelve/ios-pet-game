//
//  SelectCharacterView.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/23/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FontAwesomeKit.h"

#import "LoginViewController.h"

@class LoginViewController;
@interface SelectCharacterView : UIView {
    LoginViewController *viewController;
    UIImageView *male;
    UIImageView *female;
    UIButton *maleButton;
    UIButton *femaleButton;
    UIImageView *nextButton;
    UIImageView *prevButton;
    UIImageView *character;
    int index;
}

@property (nonatomic, assign) LoginViewController *viewController;
@property (nonatomic, assign) UIImageView *male;
@property (nonatomic, assign) UIImageView *female;
@property (nonatomic, assign) UIButton *maleButton;
@property (nonatomic, assign) UIButton *femaleButton;
@property (nonatomic, assign) UIImageView *nextButton;
@property (nonatomic, assign) UIImageView *prevButton;
@property (nonatomic, assign) UIImageView *character;
@property (nonatomic, assign) int index;

- (id)initWithFrame:(CGRect)frame andIndex:(int)index;
- (id)initWithFrame:(CGRect)frame andIndex:(int)inputIndex andImage:(NSString *)inputImage;

- (void)setMaleAndFemale;

@end
