//
//  LoginViewController.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/16/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Welcome!";
        self.view.nuiClass = @"DefaultView";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIButton *boyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [boyButton setTitle:@"Boy" forState:UIControlStateNormal];
    [boyButton setNuiClass:@"Button:LargeButton"];
    [boyButton setFrame:CGRectMake(25, 100, 110, 50)];
    [boyButton addTarget:self action:@selector(selectBoyAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:boyButton];
    
    UIButton *girlButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [girlButton setTitle:@"Girl" forState:UIControlStateNormal];
    [girlButton setNuiClass:@"Button:LargeButton"];
    [girlButton setFrame:CGRectMake(185, 100, 110, 50)];
    [girlButton addTarget:self action:@selector(selectGirlAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:girlButton];
}

- (void)selectBoyAction: (id)selector {
    NSLog(@"clicked on boy button");
    FirstPetViewController *firstPetViewController = [[FirstPetViewController alloc] init];
    [firstPetViewController setGender:@"boy"];
    [self.navigationController pushViewController:firstPetViewController animated:YES];
}

- (void)selectGirlAction: (id)selector {
    NSLog(@"clicked on girl button");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
