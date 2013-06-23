//
//  LoginNavigationController.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/19/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "LoginNavigationController.h"

@interface LoginNavigationController ()

@end

@implementation LoginNavigationController
@synthesize params = _params;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationBar.barStyle = UIBarStyleBlackOpaque;
        self.params = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
