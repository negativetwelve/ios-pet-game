//
//  HaveAcccountViewController.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/22/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "HaveAcccountViewController.h"

@interface HaveAcccountViewController ()

@end

@implementation HaveAcccountViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Login";
        self.view.nuiClass = @"DefaultView";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITextField *emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 50, 280, 31)];
    [emailTextField setPlaceholder:@"Email"];
    [emailTextField setReturnKeyType:UIReturnKeyNext];
    [emailTextField setTag:1];
    [emailTextField setNuiClass:@"TextField"];
    [emailTextField setDelegate:self];
    [emailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [emailTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self.view addSubview:emailTextField];
    
    UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 90, 280, 31)];
    [passwordTextField setPlaceholder:@"Password"];
    [passwordTextField setReturnKeyType:UIReturnKeyNext];
    [passwordTextField setTag:2];
    [passwordTextField setDelegate:self];
    [passwordTextField setNuiClass:@"TextField"];
    [passwordTextField setSecureTextEntry:YES];
    [self.view addSubview:passwordTextField];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submitButton setTitle:@"Go!" forState:UIControlStateNormal];
    [submitButton setNuiClass:@"Button:TextFieldButton"];
    [submitButton setFrame:CGRectMake(220, 130, 80, 31)];
    [submitButton addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitButton];
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    NSInteger nextTag = textField.tag + 1;
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        [nextResponder becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
        [self submitAction:textField];
    }
    return NO;
}

- (void)submitAction: (id)selector {
    NSLog(@"submitting");
    
    // send to server
    NSString *encryptionKey = @"IQPRZUDGWWCGVGHTKHRPEQAYPPAQXASH";
    UIView *signUpView = ((UIView *)selector).superview;
    NSString *email = ((UITextField *)[signUpView.subviews objectAtIndex:0]).text;
    email = [AESCrypt encrypt:email password:encryptionKey];
    NSString *password = ((UITextField *)[signUpView.subviews objectAtIndex:1]).text;
    password = [AESCrypt encrypt:password password:encryptionKey];

    NSUUID *vendorIdObject = [[UIDevice currentDevice] identifierForVendor];
    NSString *uuid = [vendorIdObject UUIDString];
    NSDictionary *user = @{@"app_id":uuid, @"email":email, @"password":password};
    NSDictionary *auth = @{@"user":user};

    // Setup our object mappings
    RKObjectMapping *userMapping = [RKObjectMapping mappingForClass:[User class]];
    [userMapping addAttributeMappingsFromDictionary:@{
     @"id" : @"userID",
     @"username" : @"username",
     @"email" : @"email",
     @"money" : @"money",
     @"bank" : @"bank",
     @"money_rate" : @"moneyRate",
     @"skill_level" : @"skillLevel",
     }];
    
    [PAURLRequest requestWithURL:@"account/login" method:RKRequestMethodPOST parameters:auth objectMapping:userMapping keyPath:@"user" delegate:self successBlock:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult){
        KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"keychainID" accessGroup:nil];
        [keychain setObject:email forKey:(__bridge id)(kSecAttrAccount)];
        [keychain setObject:password forKey:(__bridge id)(kSecValueData)];
        [self dismissViewControllerAnimated:YES completion:nil];
    } failureBlock:^(RKObjectRequestOperation *operation, NSError *error){
        NSLog(@"error!");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
