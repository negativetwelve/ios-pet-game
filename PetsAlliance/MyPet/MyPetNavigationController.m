//
//  MyPetNavigationController.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/11/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "MyPetNavigationController.h"

@interface MyPetNavigationController ()

@end

@implementation MyPetNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationBar.barStyle = UIBarStyleBlackOpaque;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Switch Pets" style:UIBarButtonItemStyleBordered target:self action:@selector(switchPets:)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Help" style:UIBarButtonItemStyleBordered target:self action:@selector(viewHelp:)];
        // Custom initialization
    }
    return self;
}

- (void)switchPets: (id) selector {
    NSLog(@"Opened the switchPets view");
}

- (void)viewHelp: (id) selector {
    NSLog(@"Opended the Help view");
    HelpViewController *helpView = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
    HelpNavigationController *helpNavgationController = [[HelpNavigationController alloc] initWithRootViewController:helpView];
    [self presentViewController:helpNavgationController animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
