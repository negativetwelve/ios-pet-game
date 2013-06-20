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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [scrollView setContentSize:CGSizeMake(5 * 320, self.view.frame.size.height)];
    [scrollView setScrollEnabled:YES];
    [scrollView setPagingEnabled:YES];
    [self.view addSubview:scrollView];
    
    SelectPetView *firstPet = [[SelectPetView alloc] initWithFrame:CGRectMake(0, 0, 320, 480) andIndex:0];
    [scrollView addSubview:firstPet];
    
    SelectPetView *secondPet = [[SelectPetView alloc] initWithFrame:CGRectMake(320, 0, 320, 480) andIndex:1];
    [scrollView addSubview:secondPet];
    
    SelectPetView *thirdPet = [[SelectPetView alloc] initWithFrame:CGRectMake(640, 0, 320, 480) andIndex:2];
    [scrollView addSubview:thirdPet];
    
    SelectPetView *fourthPet = [[SelectPetView alloc] initWithFrame:CGRectMake(960, 0, 320, 480) andIndex:3];
    [scrollView addSubview:fourthPet];
    
    SelectPetView *fifthPet = [[SelectPetView alloc] initWithFrame:CGRectMake(1280, 0, 320, 480) andIndex:4];
    [scrollView addSubview:fifthPet];
}

- (void)selectPetAction: (id)selector {
    SelectPetView *selected = (SelectPetView *)((UIButton *)selector).superview;
    NSLog(@"selected pet %d!", selected.index);
    SignUpViewController *signUpViewController = [[SignUpViewController alloc] init];
    [self.navigationController pushViewController:signUpViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
