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
@synthesize rowHeights = _rowHeights;
@synthesize battleTableView = _battleTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Battle";
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"My Items" style:UIBarButtonItemStyleBordered target:self action:@selector(viewMyItems:)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Leaderboard" style:UIBarButtonItemStyleDone target:self action:@selector(viewLeaderboard:)];
        self.rowHeights = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < 10; i++) {
            [self.rowHeights addObject:[NSNumber numberWithFloat:100]];
        }
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
    [self setBattleTableView:battleTableView];
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
        [battleButton setFrame:CGRectMake(220, 21, 80, 37)];
        [battleButton addTarget:self action:@selector(battleButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [battleButton setTitle:@"Battle!" forState:UIControlStateNormal];
        [battleButton setNuiClass:@"SecondaryButton"];
        
        [cell addSubview:battleButton];
        
        UIImageView *character = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 60)];
        [character setImage:[UIImage imageNamed:@"male.png"]];
        [cell addSubview:character];
        
        UIButton *firstPetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [firstPetButton setNuiClass:@"ImageButon"];
        [firstPetButton setFrame:CGRectMake(50, 10, 50, 50)];
        [firstPetButton setBackgroundImage:[UIImage imageNamed:@"dragon.png"] forState:UIControlStateNormal];
        [firstPetButton addTarget:self action:@selector(firstPetSelected:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:firstPetButton];
        
        UIImageView *secondPet = [[UIImageView alloc] initWithFrame:CGRectMake(105, 10, 50, 50)];
        [secondPet setImage:[UIImage imageNamed:@"cat.png"]];
        [cell addSubview:secondPet];
        
        UIImageView *thirdPet = [[UIImageView alloc] initWithFrame:CGRectMake(160, 10, 50, 50)];
        [thirdPet setImage:[UIImage imageNamed:@"cat.png"]];
        [cell addSubview:thirdPet];
        
        UILabel *username = [[UILabel alloc] initWithFrame:CGRectMake(5, 65, 60, 15)];
        [username setText:@"Username"];
        [username setNuiClass:@"Label:BattleUsername"];
        [cell addSubview:username];
    }
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

- (void)firstPetSelected: (id)selector {
    NSLog(@"first pet selected");
    UITableViewCell *selected = ((UITableViewCell *)selector).superview;
    NSLog(@"%d", selected.tag);
    [self.rowHeights setObject:[NSNumber numberWithFloat:[[self.rowHeights objectAtIndex:selected.tag] floatValue] + 50] atIndexedSubscript:selected.tag];
    NSLog(@"%@", self.rowHeights);
    [self.battleTableView beginUpdates];
    [self.battleTableView endUpdates];
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
