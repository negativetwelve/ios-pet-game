//
//  Success.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/30/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface Success : NSObject

@property (nonatomic, copy) NSString *reason;
@property (nonatomic, copy) NSNumber *code;

+ (RKObjectMapping *)mapping;
+ (RKResponseDescriptor *)responseDescriptor;

@end
