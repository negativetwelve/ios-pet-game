//
//  SignUpViewController.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/19/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController
@synthesize originalCenter = _originalCenter;
@synthesize verifiedText = _verifiedText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Account";
        self.view.nuiClass = @"DefaultView";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.originalCenter = CGPointMake(self.view.center.x, self.view.center.y - 44); // HACK, need to fix.

    UITextField *emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 140, 280, 31)];
    [emailTextField setPlaceholder:@"Email"];
    [emailTextField setReturnKeyType:UIReturnKeyNext];
    [emailTextField setTag:1];
    [emailTextField setNuiClass:@"TextField"];
    [emailTextField setDelegate:self];
    [emailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [emailTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self.view addSubview:emailTextField];

    UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 180, 280, 31)];
    [passwordTextField setPlaceholder:@"Password"];
    [passwordTextField setReturnKeyType:UIReturnKeyNext];
    [passwordTextField setTag:2];
    [passwordTextField setDelegate:self];
    [passwordTextField setNuiClass:@"TextField"];
    [passwordTextField setSecureTextEntry:YES];
    [self.view addSubview:passwordTextField];
    
    UITextField *passwordConfirmationTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 220, 280, 31)];
    [passwordConfirmationTextField setPlaceholder:@"Password Confirmation"];
    [passwordConfirmationTextField setReturnKeyType:UIReturnKeyDone];
    [passwordConfirmationTextField setTag:3];
    [passwordConfirmationTextField setDelegate:self];
    [passwordConfirmationTextField setNuiClass:@"TextField"];
    [passwordConfirmationTextField setSecureTextEntry:YES];
    [passwordConfirmationTextField addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:passwordConfirmationTextField];
    
    UILabel *verified = [[UILabel alloc] initWithFrame:CGRectMake(20, 260, 280, 20)];
    [verified setText:@""];
    [verified setNuiClass:@"DenyText"];
    [verified setHidden:YES];
    [self setVerifiedText:verified];
    [self.view addSubview:verified];

    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submitButton setTitle:@"Submit!" forState:UIControlStateNormal];
    [submitButton setNuiClass:@"Button:LargeButton"];
    [submitButton setFrame:CGRectMake(70, 300, 180, 50)];
    [submitButton addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitButton];
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
    NSString *passwordConfirmation = ((UITextField *)[signUpView.subviews objectAtIndex:2]).text;
    passwordConfirmation = [AESCrypt encrypt:passwordConfirmation password:encryptionKey];
    NSMutableDictionary *params = ((LoginNavigationController *)self.navigationController).params;
    NSLog(@"PARAMS: %@", params);
    NSString *username = [params valueForKey:@"username"];
    NSString *character = [params valueForKey:@"character"];
    NSString *petKind = [params valueForKey:@"petKind"];
    
    NSUUID *vendorIdObject = [[UIDevice currentDevice] identifierForVendor];
    NSString *uuid = [vendorIdObject UUIDString];
    NSDictionary *user = @{@"app_id":uuid, @"email":email, @"password":password, @"password_confirmation":passwordConfirmation, @"username":username, @"character":character};
    NSDictionary *pet = @{@"pet_kind":petKind};
    NSDictionary *auth = @{@"user":user, @"pet":pet};
    
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
    
    
    RKObjectManager *manager = [RKObjectManager sharedManager];
    AFHTTPClient *client = [manager HTTPClient];
    
    NSMutableURLRequest *request = [client requestWithMethod:@"POST" path:@"account/create" parameters:auth];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Loading";
    
    AFJSONRequestOperation *createAccountOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        [hud hide:YES];
        KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"keychainID" accessGroup:nil];
        [keychain setObject:email forKey:(__bridge id)(kSecAttrAccount)];
        [keychain setObject:password forKey:(__bridge id)(kSecValueData)];
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        [hud hide:YES];
        NSDictionary *jsonResponse = (NSDictionary *)JSON;
        [self authNotVerified:jsonResponse];
    }];
    
    [client enqueueHTTPRequestOperation:createAccountOperation];
}

- (void)authNotVerified: (NSDictionary *)jsonResponse {
    NSLog(@"not verified");
    NSString *reason = [[jsonResponse objectForKey:@"error"] objectForKey:@"reason"];
    [NUILabelRenderer render:self.verifiedText withClass:@"DenyText"];
    [self.verifiedText setText:reason];
    [self.verifiedText setHidden:NO];
    [self.verifiedText setAlpha:1];
    NSLog(@"%@", reason);
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.center = CGPointMake(self.originalCenter.x, self.originalCenter.y - 100);
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.center = self.originalCenter;
    [UIView commitAnimations];
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField {
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
