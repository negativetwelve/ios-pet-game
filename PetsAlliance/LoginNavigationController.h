//
//  LoginNavigationController.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/19/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginNavigationController : UINavigationController {
    NSMutableDictionary *params;
}

@property (nonatomic, retain) NSMutableDictionary *params;

@end
