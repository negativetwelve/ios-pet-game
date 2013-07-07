//
//  HaveAcccountViewController.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/22/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

#import "MMViewController.h"

#import "KeychainItemWrapper.h"

#import "UIButton+NUI.h"
#import "UILabel+NUI.h"
#import "UITextField+NUI.h"

#import "AESCrypt.h"

#import "User.h"
#import "Pet.h"
#import "Error.h"
#import "Success.h"

#import "PAURLRequest.h"
#import "MBProgressHUD.h"

#import "MyPetViewController.h"

@class MyPetViewController;
@interface HaveAcccountViewController : MMViewController <UITextFieldDelegate> {
    MyPetViewController *myPetViewController;
    UILabel *verifiedText;
}

@property (nonatomic, retain) MyPetViewController *myPetViewController;
@property (nonatomic, assign) UILabel *verifiedText;

- (id)init:(MyPetViewController *)petView;

@end
