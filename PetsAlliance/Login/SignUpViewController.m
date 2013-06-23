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
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submitButton setTitle:@"Submit!" forState:UIControlStateNormal];
    [submitButton setNuiClass:@"Button:LargeButton"];
    [submitButton setFrame:CGRectMake(70, 280, 180, 50)];
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
    
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"keychainID" accessGroup:nil];

    NSUUID *vendorIdObject = [[UIDevice currentDevice] identifierForVendor];
    NSString *uuid = [vendorIdObject UUIDString];
    NSDictionary *user = @{@"app_id":uuid, @"email":email, @"password":password, @"password_confirmation":passwordConfirmation};
    NSDictionary *auth = @{@"user":user};
    
    NSURL *localURL = [NSURL URLWithString:LOCALURL];
    AFHTTPClient* client = [[AFHTTPClient alloc] initWithBaseURL:localURL];
    
    //we want to work with JSON-Data
    [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    
    // Initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
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

    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:userMapping pathPattern:nil keyPath:@"user" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    NSMutableURLRequest *request = [objectManager requestWithObject:nil method:RKRequestMethodPOST path:@"account/create" parameters:auth];
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ responseDescriptor ]];
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        RKLogInfo(@"Load collection of Authentication: %@", mappingResult.array);
        [keychain setObject:email forKey:(__bridge id)(kSecAttrAccount)];
        [keychain setObject:password forKey:(__bridge id)(kSecValueData)];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        RKLogError(@"Operation failed with error: %@", error);
    }];
    
    [objectRequestOperation start];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
        [self submitAction:textField];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
