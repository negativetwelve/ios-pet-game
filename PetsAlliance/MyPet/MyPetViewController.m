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

    UIButton *itemStoreButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [itemStoreButton setFrame:CGRectMake(20, 220, 110, 31)];
    [itemStoreButton setTitle:@"Item Store" forState:UIControlStateNormal];
    [itemStoreButton setNuiClass:@"Button:TextFieldButton"];
    [itemStoreButton addTarget:self action:@selector(itemStoreAction:) forControlEvents:UIControlEventTouchUpInside];
    [mainPetView addSubview:itemStoreButton];
    
    // Probably want to remove later.
    UIButton *healButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [healButton setFrame:CGRectMake(20, 180, 110, 31)];
    [healButton setTitle:@"Heal Pets" forState:UIControlStateNormal];
    [healButton setNuiClass:@"Button:TextFieldButton"];
    [healButton addTarget:self action:@selector(healPets:) forControlEvents:UIControlEventTouchUpInside];
    [mainPetView addSubview:healButton];
}

- (void)loadUser:(User *)user andPets:(NSArray *)pets {
    [self loadUser:user];
    [self loadPets:pets];
    // Set the persistent user object.
    [self.petStatusView setUser:user];
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


- (void)itemStoreAction: (id) selector {
    NSLog(@"clicked on item store button");
}

- (void)healPets:(id)selector {
    NSLog(@"healing pets");

    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:self.petStatusView.user.encid forKey:@"user_id"];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Healing...";
    
    NSMutableURLRequest *request = [[RKObjectManager sharedManager] requestWithObject:nil method:RKRequestMethodPOST path:@"heal" parameters:params];
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ Success.responseDescriptor, Error.responseDescriptor ]];
    
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        [hud hide:YES];

    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [hud hide:YES];
        NSLog(@"error!");
        NSString *reason = ((Error *)[[error.userInfo objectForKey:RKObjectMapperErrorObjectsKey] firstObject]).reason;
        NSLog(@"%@", reason);
    }];
    
    [[RKObjectManager sharedManager] enqueueObjectRequestOperation:objectRequestOperation];
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
