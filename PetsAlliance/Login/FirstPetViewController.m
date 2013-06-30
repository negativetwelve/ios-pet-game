//
//  FirstPetViewController.m
//  
//
//  Created by Mark Miyashita on 6/19/13.
//
//

#import "FirstPetViewController.h"

@interface FirstPetViewController ()

@end

@implementation FirstPetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Select a pet!";
        self.view.nuiClass = @"DefaultView";
    }
    return self;
}

- (id)init:(MyPetViewController *)petView {
    self = [self init];
    self.myPetViewController = petView;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [scrollView setContentSize:CGSizeMake(5 * 320, self.view.frame.size.height)];
    [scrollView setScrollEnabled:YES];
    [scrollView setPagingEnabled:YES];
    [self.view addSubview:scrollView];
    
    SelectPetView *firstPet = [[SelectPetView alloc] initWithFrame:CGRectMake(0, 0, 320, 480) andIndex:0 andName:@"dratlantic"];
    [scrollView addSubview:firstPet];
    
    SelectPetView *secondPet = [[SelectPetView alloc] initWithFrame:CGRectMake(320, 0, 320, 480) andIndex:1 andName:@"hailwhal"];
    [scrollView addSubview:secondPet];
    
    SelectPetView *thirdPet = [[SelectPetView alloc] initWithFrame:CGRectMake(640, 0, 320, 480) andIndex:2 andName:@"reptiling"];
    [scrollView addSubview:thirdPet];
    
    SelectPetView *fourthPet = [[SelectPetView alloc] initWithFrame:CGRectMake(960, 0, 320, 480) andIndex:3 andName:@"serbeagle"];
    [scrollView addSubview:fourthPet];
    
    SelectPetView *fifthPet = [[SelectPetView alloc] initWithFrame:CGRectMake(1280, 0, 320, 480) andIndex:4 andName:@"sharpent"];
    [scrollView addSubview:fifthPet];
}

- (void)selectPetAction: (id)selector {
    SelectPetView *selected = (SelectPetView *)((UIButton *)selector).superview;
    NSLog(@"selected pet %d!", selected.index);
    
    NSMutableDictionary *params = ((LoginNavigationController *)self.navigationController).params;
    [params setObject:selected.name forKey:@"name"];
    
    SignUpViewController *signUpViewController = [[SignUpViewController alloc] init:self.myPetViewController];
    [self.navigationController pushViewController:signUpViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
