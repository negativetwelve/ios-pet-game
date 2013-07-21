//
//  Attack.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/20/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface Attack : NSObject

@property (nonatomic, copy) NSNumber *encid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *pp;

+ (RKObjectMapping *)mapping;
+ (RKResponseDescriptor *)responseDescriptor;

@end
