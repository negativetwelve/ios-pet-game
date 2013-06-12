//
//  MyPetViewController.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/10/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "MyPetViewController.h"

@interface MyPetViewController ()

@end

@implementation MyPetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"My Pet";
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Switch Pets" style:UIBarButtonItemStyleBordered target:self action:@selector(switchPets:)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Help" style:UIBarButtonItemStyleBordered target:self action:@selector(viewHelp:)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = NO;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:scrollView];
    
    PetStatusView *petStatusView = [[PetStatusView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    [scrollView addSubview:petStatusView];
    
    UIView *mainPetView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 320, 400)];
    mainPetView.backgroundColor = [UIColor greenColor];
    [scrollView addSubview:mainPetView];
    
    UIView *equipmentView = [[UIView alloc] initWithFrame:CGRectMake(20, 320, 280, 80)];
    equipmentView.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:equipmentView];
    
    UIButton *myItemsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [myItemsButton setFrame:CGRectMake(20, 20, 110, 50)];
    [myItemsButton setTitle:@"My Items" forState:UIControlStateNormal];
    [myItemsButton addTarget:self action:@selector(myItemsAction:) forControlEvents:UIControlEventTouchUpInside];
    [mainPetView addSubview:myItemsButton];

}

- (void)myItemsAction: (id) selector {
    NSLog(@"clicked on my items button");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)switchPets: (id) selector {
    NSLog(@"Opened the switchPets view");
    SwitchPetsViewController *switchPetsView = [[SwitchPetsViewController alloc] initWithNibName:@"SwitchPetsViewController" bundle:nil];
    SwitchPetsNavigationController *switchPetsNavigationController = [[SwitchPetsNavigationController alloc] initWithRootViewController:switchPetsView];
    [self presentViewController:switchPetsNavigationController animated:YES completion:nil];
    
}

- (void)viewHelp: (id) selector {
    NSLog(@"Opended the Help view");
    HelpViewController *helpView = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
    HelpNavigationController *helpNavgationController = [[HelpNavigationController alloc] initWithRootViewController:helpView];
    [self presentViewController:helpNavgationController animated:YES completion:nil];
}




@end
