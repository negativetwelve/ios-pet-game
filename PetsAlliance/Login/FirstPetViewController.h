//
//  FirstPetViewController.h
//  
//
//  Created by Mark Miyashita on 6/19/13.
//
//

#import <UIKit/UIKit.h>

#import "MMViewController.h"

#import "SelectPetView.h"
#import "SignUpViewController.h"

@class MyPetViewController;
@interface FirstPetViewController : MMViewController

@property (nonatomic, copy) NSString *gender;
@property (nonatomic, retain) MyPetViewController *myPetViewController;

- (id)init:(MyPetViewController *)petView;

@end
