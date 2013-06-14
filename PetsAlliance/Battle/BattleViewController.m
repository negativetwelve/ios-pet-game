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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Battle";
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"My Items" style:UIBarButtonItemStyleBordered target:self action:@selector(viewMyItems:)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Leaderboard" style:UIBarButtonItemStyleDone target:self action:@selector(viewLeaderboard:)];
    }
    return self;
}

- (void)viewMyItems: (id)selector {
    NSLog(@"clicked on view my items");
    ItemsViewController *itemsViewController = [[ItemsViewController alloc] init];
    ItemsNavigationController *itemsNavigationController = [[ItemsNavigationController alloc] initWithRootViewController:itemsViewController];
    [self presentViewController:itemsNavigationController animated:YES completion:nil];
}

- (void)viewLeaderboard: (id)selector {
    NSLog(@"clicked on view leaderboard");
    LeaderboardViewController *leaderboardView = [[LeaderboardViewController alloc] init];
    LeaderboardNavigationController *leaderboardNavigationController = [[LeaderboardNavigationController alloc] initWithRootViewController:leaderboardView];
    [self presentViewController:leaderboardNavigationController animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    int petStatusViewHeight = 100;
    int navHeight = self.tabBarController.tabBar.frame.size.height + self.navigationController.navigationBar.frame.size.height;
    
    PetStatusView *petStatusView = [[PetStatusView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, petStatusViewHeight)];
    [self.view addSubview:petStatusView];
    
    battleTableView = [[BattleTableView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height - 100 - navHeight)];
    [self.view addSubview:battleTableView];

    battleTableView.dataSource = self;
    battleTableView.delegate = self;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIButton *battleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [battleButton setFrame:CGRectMake(220, 20, 80, 40)];
        [battleButton addTarget:self action:@selector(battleButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [battleButton setTitle:@"Battle!" forState:UIControlStateNormal];
        [cell addSubview:battleButton];
    }

    [cell setTag:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Opponent #%d", cell.tag];
    return cell;
}


- (void)battleButtonPressed: (id)selector {
    NSLog(@"battle button pressed");
    CGPoint buttonPosition = [selector convertPoint:CGPointZero toView:battleTableView];
    NSIndexPath *indexPath = [battleTableView indexPathForRowAtPoint:buttonPosition];
    if (indexPath != nil) {
        NSLog(@"%d", indexPath.row);
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
