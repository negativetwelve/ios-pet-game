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
    [battleTableView setDataSource:self];
    [battleTableView setDelegate:self];
    [self.view addSubview:battleTableView];

    battleTableView.dataSource = self;
    battleTableView.delegate = self;
}

#pragma mark UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
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
        
        UIImageView *character = [[UIImageView alloc] initWithFrame:CGRectMake(5, 35, 40, 60)];
        [character setImage:[UIImage imageNamed:@"male.png"]];
        [cell addSubview:character];

        PetSelectButton *firstPetButton = [[PetSelectButton alloc] initWithFrame:CGRectMake(55, 45, 50, 50) andNuiClass:@"ImageButton" andImageName:@"dragon.png" andSelector:@selector(petSelected:) andCell:cell andIndex:1];
        [cell addSubview:firstPetButton];
        
        PetSelectButton *secondPetButton = [[PetSelectButton alloc] initWithFrame:CGRectMake(110, 45, 50, 50) andNuiClass:@"ImageButton" andImageName:@"cat.png" andSelector:@selector(petSelected:) andCell:cell andIndex:2];
        [cell addSubview:secondPetButton];
        
        PetSelectButton *thirdPetButton = [[PetSelectButton alloc] initWithFrame:CGRectMake(165, 45, 50, 50) andNuiClass:@"ImageButton" andImageName:@"cat.png" andSelector:@selector(petSelected:) andCell:cell andIndex:3];
        [cell addSubview:thirdPetButton];
        
        UILabel *username = [[UILabel alloc] initWithFrame:CGRectMake(5, 2, 120, 15)];
        [username setText:@"really really long username"];
        [username setNuiClass:@"Label:BattleBoldText"];
        [cell addSubview:username];
        
        UILabel *skillLevel = [[UILabel alloc] initWithFrame:CGRectMake(5, 18, 40, 15)];
        [skillLevel setText:@"Skill Lvl"];
        [skillLevel setNuiClass:@"Label:BattleStat"];
        [cell addSubview:skillLevel];
        
        UILabel *skillLevelValue = [[UILabel alloc] initWithFrame:CGRectMake(45, 18, 35, 15)];
        [skillLevelValue setText:@"10053"];
        [skillLevelValue setNuiClass:@"Label:BattleValue"];
        [cell addSubview:skillLevelValue];
        
        UILabel *wins = [[UILabel alloc] initWithFrame:CGRectMake(140, 2, 35, 15)];
        [wins setText:@"Wins"];
        [wins setNuiClass:@"Label:BattleStat"];
        [cell addSubview:wins];
        
        UILabel *winsValue = [[UILabel alloc] initWithFrame:CGRectMake(180, 2, 45, 15)];
        [winsValue setText:@"1234567"];
        [winsValue setNuiClass:@"Label:BattleValue"];
        [cell addSubview:winsValue];
        
        UILabel *losses = [[UILabel alloc] initWithFrame:CGRectMake(140, 18, 35, 15)];
        [losses setText:@"Losses"];
        [losses setNuiClass:@"Label:BattleStat"];
        [cell addSubview:losses];
        
        UILabel *lossesValue = [[UILabel alloc] initWithFrame:CGRectMake(180, 18, 45, 15)];
        [lossesValue setText:@"154000"];
        [lossesValue setNuiClass:@"Label:BattleValue"];
        [cell addSubview:lossesValue];
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

- (void)petSelected: (id)selector {
    PetSelectButton *selectedButton = (PetSelectButton *)selector;
    BattleCell *selected = selectedButton.cell;
    NSLog(@"pet selected at index: %d", selectedButton.index);

    int currentHeight = selected.bounds.size.height;
    if (currentHeight == 100) {
        for (NSUInteger i = 0; i < [self.rowHeights count]; i++) {
            [self.rowHeights setObject:[NSNumber numberWithFloat:100] atIndexedSubscript:i];
        }
        [self.rowHeights setObject:[NSNumber numberWithFloat:160] atIndexedSubscript:selected.tag];
        [selected setPetIndex:selectedButton.index];
        // show current pet
    } else if (selected.petIndex == selectedButton.index){
        [self.rowHeights setObject:[NSNumber numberWithFloat:100] atIndexedSubscript:selected.tag];
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
