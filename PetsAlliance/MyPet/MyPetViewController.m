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
@synthesize uiScrollView;
@synthesize petStatusView;
@synthesize character;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Status";
        self.view.nuiClass = @"DefaultView";
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Switch Pets" style:UIBarButtonItemStyleBordered target:self action:@selector(switchPets:)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Help" style:UIBarButtonItemStyleBordered target:self action:@selector(viewHelp:)];
    }
    return self;
}

- (id)initWithPetStatusView:(PetStatusView *)petStatus {
    self = [self init];
    if (self) {
        self.petStatusView = petStatus;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.view addSubview:petStatusView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    int navHeight = self.tabBarController.tabBar.frame.size.height + self.navigationController.navigationBar.frame.size.height;

    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height - 100 - navHeight)];
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = NO;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
//    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:scrollView];
    
    [self setUiScrollView:scrollView];
    
    UIImageView *userChar = [[UIImageView alloc] initWithFrame:CGRectMake(180, 10, 120, 240)];
    [userChar setImage:[UIImage imageNamed:@""]];
    [scrollView addSubview:userChar];
    [self setCharacter:userChar];
    
    [self setupUserLabels:@{
     @"Username" : @"",
     @"Skill Level" : @"",
    } inView:scrollView startingAtX:10 andY:10];
    
    UIView *mainPetView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
    [scrollView addSubview:mainPetView];
    
    UIButton *myItemsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [myItemsButton setFrame:CGRectMake(20, 180, 110, 31)];
    [myItemsButton setTitle:@"My Items" forState:UIControlStateNormal];
    [myItemsButton setNuiClass:@"Button:TextFieldButton"];
    [myItemsButton addTarget:self action:@selector(myItemsAction:) forControlEvents:UIControlEventTouchUpInside];
    [mainPetView addSubview:myItemsButton];

    UIButton *itemStoreButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [itemStoreButton setFrame:CGRectMake(20, 220, 110, 31)];
    [itemStoreButton setTitle:@"Item Store" forState:UIControlStateNormal];
    [itemStoreButton setNuiClass:@"Button:TextFieldButton"];
    [itemStoreButton addTarget:self action:@selector(itemStoreAction:) forControlEvents:UIControlEventTouchUpInside];
    [mainPetView addSubview:itemStoreButton];
}

- (void)loadUser:(User *)user andPets:(NSArray *)pets {
    [self loadUser:user];
    [self loadPets:pets];
}

- (void)setupUserLabels: (NSDictionary *)data inView:(UIScrollView *)view startingAtX:(int)x andY:(int)y {
    int i = 0;
    for(id key in data) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y + i, 100, 15)];
        [label setNuiClass:@"Label:TinyLabel"];
        [label setText:[NSString stringWithFormat:@"%@: %@", key, [data objectForKey:key]]];
        [view addSubview:label];
        i += 15;
    }
}

- (void)buttonAction: (id) selector {
    NSLog(@"clicked on Pet button");
}

- (void)myItemsAction: (id) selector {
    NSLog(@"clicked on my items button");
    ItemsViewController *itemsViewController = [[ItemsViewController alloc] init];
    ItemsNavigationController *itemsNavigationController = [[ItemsNavigationController alloc] initWithRootViewController:itemsViewController];
    [self presentViewController:itemsNavigationController animated:YES completion:nil];
}

- (void)itemStoreAction: (id) selector {
    NSLog(@"clicked on item store button");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)switchPets: (id) selector {
    NSLog(@"Opened the switchPets view");
    SwitchPetsViewController *switchPetsView = [[SwitchPetsViewController alloc] init];
    [switchPetsView setHome:self];
    SwitchPetsNavigationController *switchPetsNavigationController = [[SwitchPetsNavigationController alloc] initWithRootViewController:switchPetsView];
    [self presentViewController:switchPetsNavigationController animated:YES completion:nil];
}

- (void)viewHelp: (id) selector {
    NSLog(@"Opened the Help view");
    HelpViewController *helpView = [[HelpViewController alloc] init];
    HelpNavigationController *helpNavgationController = [[HelpNavigationController alloc] initWithRootViewController:helpView];
    [self presentViewController:helpNavgationController animated:YES completion:nil];
}

- (void)loadPets: (NSArray *)pets {
    NSLog(@"loading pets");
    [self.petStatusView loadPets:pets];
}

- (void)loadUser: (User *)user {
    NSLog(@"loading user %@.png", user.character);
    [self.character setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", user.character]]];
}

@end
