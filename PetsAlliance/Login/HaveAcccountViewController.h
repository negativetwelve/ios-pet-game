//
//  HaveAcccountViewController.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/22/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

#import "KeychainItemWrapper.h"

#import "UIButton+NUI.h"
#import "UILabel+NUI.h"
#import "UITextField+NUI.h"

#import "AESCrypt.h"
#import "User.h"
#import "Pet.h"

#import "PAURLRequest.h"
#import "MBProgressHUD.h"

#import "MyPetViewController.h"

@class MyPetViewController;
@interface HaveAcccountViewController : UIViewController <UITextFieldDelegate> {
    MyPetViewController *myPetViewController;
}

@property (nonatomic, retain) MyPetViewController *myPetViewController;

- (id)init:(MyPetViewController *)petView;

@end
