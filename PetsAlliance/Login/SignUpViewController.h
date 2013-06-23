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


@interface SignUpViewController : UIViewController <UITextFieldDelegate>

@end
