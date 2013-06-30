//
//  SignUpViewController.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/19/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

#import "KeychainItemWrapper.h"
#import "AESCrypt.h"

#import "UIButton+NUI.h"
#import "UILabel+NUI.h"
#import "UITextField+NUI.h"

#import "User.h"

#import "PAURLRequest.h"
#import "MBProgressHUD.h"

#import "LoginNavigationController.h"
#import "MyPetViewController.h"

@class MyPetViewController;
@interface SignUpViewController : UIViewController <UITextFieldDelegate> {
    CGPoint originalCenter;
    UILabel *verifiedText;
}

@property (nonatomic, assign) CGPoint originalCenter;
@property (nonatomic, assign) UILabel *verifiedText;
@property (nonatomic, retain) MyPetViewController *myPetViewController;

- (id)init:(MyPetViewController *)petView;

@end
