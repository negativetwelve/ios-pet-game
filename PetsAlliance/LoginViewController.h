//
//  LoginViewController.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/16/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MBProgressHUD.h"

#import "UIButton+NUI.h"
#import "UILabel+NUI.h"
#import "UITextField+NUI.h"

#import "FirstPetViewController.h"
#import "HaveAcccountViewController.h"
#import "SelectCharacterView.h"

#import "PAURLRequest.h"

#import "LoginNavigationController.h"

@class SelectCharacterView;
@interface LoginViewController : UIViewController <UITextFieldDelegate> {
    UIScrollView *mainScrollView;
    UIImageView *male;
    UIImageView *female;
    UIImageView *nextButton;
    UIButton *maleButton;
    UIButton *femaleButton;
    UIButton *accountButton;
    UIButton *resetButton;
    UILabel *verifiedText;
    UITextField *usernameField;

    CGPoint originalCenter;
    int numCharacters;
    NSMutableArray *characterViews;
    
    MyPetViewController *myPetViewController;
}

@property (nonatomic, assign) UIScrollView *mainScrollView;
@property (nonatomic, assign) UIImageView *male;
@property (nonatomic, assign) UIImageView *female;
@property (nonatomic, assign) UIImageView *nextButton;
@property (nonatomic, assign) UIButton *maleButton;
@property (nonatomic, assign) UIButton *femaleButton;
@property (nonatomic, assign) UIButton *accountButton;
@property (nonatomic, assign) UIButton *resetButton;
@property (nonatomic, assign) UILabel *verifiedText;
@property (nonatomic, assign) UITextField *usernameField;

@property (nonatomic, assign) CGPoint originalCenter;
@property (nonatomic, assign) int numCharacters;
@property (nonatomic, retain) NSMutableArray *characterViews;

@property (nonatomic, retain) MyPetViewController *myPetViewController;

- (UIButton *)makeGoBackButton: (NSString *)gender;
- (id)init:(MyPetViewController *)petView;

@end
