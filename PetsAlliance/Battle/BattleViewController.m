//
//  BattleViewController.m
//  
//
//  Created by Mark Miyashita on 6/13/13.
//
//

#import "BattleViewController.h"

@interface BattleViewController ()

@end

@implementation BattleViewController
@synthesize petStatusView;
@synthesize rowHeights = _rowHeights;
@synthesize battleTableView = _battleTableView;
@synthesize users;
@synthesize refreshControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Battles";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Leaderboard" style:UIBarButtonItemStyleDone target:self action:@selector(viewLeaderboard:)];
        self.rowHeights = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < 10; i++) {
            [self.rowHeights addObject:[NSNumber numberWithFloat:120]];
        }
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

- (void)viewLeaderboard: (id)selector {
    NSLog(@"clicked on view leaderboard");
    LeaderboardViewController *leaderboardView = [[LeaderboardViewController alloc] init];
    LeaderboardNavigationController *leaderboardNavigationController = [[LeaderboardNavigationController alloc] initWithRootViewController:leaderboardView];
    [self presentViewController:leaderboardNavigationController animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    int navHeight = self.tabBarController.tabBar.frame.size.height + self.navigationController.navigationBar.frame.size.height;
    
    battleTableView = [[BattleTableView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height - 100 - navHeight)];
    [self setBattleTableView:battleTableView];
    [battleTableView setDataSource:self];
    [battleTableView setDelegate:self];
    [self.view addSubview:battleTableView];
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self
                action:@selector(refreshTable:)
      forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
    [battleTableView addSubview:refresh];
    
    [self refreshTable:self.refreshControl];
}

- (void)refreshTable: (UIRefreshControl *)calledRefreshControl {
    NSLog(@"refresh table");
    [calledRefreshControl beginRefreshing];
    
    [self loadUsers];
}

- (void)loadUsers {
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.mode = MBProgressHUDModeIndeterminate;
//    hud.labelText = @"Loading";
    
    NSMutableURLRequest *request = [[RKObjectManager sharedManager] requestWithObject:nil method:RKRequestMethodGET path:@"battles" parameters:nil];
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ User.usersResponseDescriptor, Pet.responseDescriptor, Success.responseDescriptor, Error.responseDescriptor ]];
    
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        [self setUsers:[mappingResult.dictionary objectForKey:@"users"]];
//        [hud hide:YES];
        [self.refreshControl endRefreshing];
        NSLog(@"USERS %@", self.users);
        [self.battleTableView reloadData];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
//        [hud hide:YES];
        [self.refreshControl endRefreshing];

        NSLog(@"error!");
        NSString *reason = ((Error *)[[error.userInfo objectForKey:RKObjectMapperErrorObjectsKey] firstObject]).reason;
        NSLog(@"%@", reason);
    }];
    
    [[RKObjectManager sharedManager] enqueueObjectRequestOperation:objectRequestOperation];
}

#pragma mark UITableViewDataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.users count];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (self.battleTableView.contentOffset.y < -50 && ![self.refreshControl isRefreshing]) {
        [self refreshTable:self.refreshControl];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"identifier";
    BattleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (cell == nil) {
        cell = [[BattleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        UIButton *battleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [battleButton setFrame:CGRectMake(230, 35, 80, 37)];
        [battleButton addTarget:self action:@selector(battleButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [battleButton setTitle:@"Battle!" forState:UIControlStateNormal];
        [battleButton setNuiClass:@"SecondaryButton"];
        [cell addSubview:battleButton];
    }

    User *user = [users objectAtIndex:indexPath.row];
    
    [cell.character setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", user.character]]];
    
    for (int i = 0; i < [cell.petButtons count]; i++) {
        PetSelectButton *petSelectButton = [cell.petButtons objectAtIndex:i];
        if (i < [user.userPets count]) {
            Pet *pet = [user.userPets objectAtIndex:i];
            [petSelectButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", pet.name]] forState:UIControlStateNormal];
            [petSelectButton setUserInteractionEnabled:YES];
        } else {
            [petSelectButton setBackgroundImage:nil forState:UIControlStateNormal];
            [petSelectButton setUserInteractionEnabled:NO];
        }
    }

    [cell.username setText:user.username];
    [cell.skillLevelValue setText:[NSString stringWithFormat:@"%@", user.skillLevel]];
    [cell.winsValue setText:@"1234567"];
    [cell.lossesValue setText:@"154000"];
    
    cell.tag = indexPath.row;
    return cell;
}

- (void)updateTable: (UITableView *)tableView {
    [tableView beginUpdates];
    [tableView endUpdates];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.rowHeights objectAtIndex:indexPath.row] floatValue];
}

- (void)petSelected: (id)selector {
    PetSelectButton *selectedButton = (PetSelectButton *)selector;
    BattleCell *selected = selectedButton.cell;
    NSLog(@"pet selected at index: %d", selectedButton.index);

    int currentHeight = selected.bounds.size.height;
    if (currentHeight == 120) {
        for (NSUInteger i = 0; i < [self.rowHeights count]; i++) {
            [self.rowHeights setObject:[NSNumber numberWithFloat:120] atIndexedSubscript:i];
        }
        [self.rowHeights setObject:[NSNumber numberWithFloat:180] atIndexedSubscript:selected.tag];
        [selected setPetIndex:selectedButton.index];
        // show current pet
    } else if (selected.petIndex == selectedButton.index){
        [self.rowHeights setObject:[NSNumber numberWithFloat:120] atIndexedSubscript:selected.tag];
        [selected setPetIndex:0];
    } else {
        [selected setPetIndex:selectedButton.index];
        // show new current pet
    }
    
    [self.battleTableView beginUpdates];
    [self.battleTableView endUpdates];
}

- (void)battleButtonPressed: (id)selector {
    NSLog(@"battle button pressed");
    CGPoint buttonPosition = [selector convertPoint:CGPointZero toView:battleTableView];
    NSIndexPath *indexPath = [battleTableView indexPathForRowAtPoint:buttonPosition];
    if (indexPath != nil) {
        NSLog(@"battling against pet number %d", indexPath.row);
        InBattleViewController *inBattleViewController = [[InBattleViewController alloc] init];
        [self presentViewController:inBattleViewController animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
