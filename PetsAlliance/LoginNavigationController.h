//
//  LoginNavigationController.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/19/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPetViewController.h"

@class MyPetViewController;
@interface LoginNavigationController : UINavigationController {
    NSMutableDictionary *params;
    MyPetViewController *myPetViewController;
}

@property (nonatomic, retain) NSMutableDictionary *params;
@property (nonatomic, retain) MyPetViewController *myPetViewController;

@end
