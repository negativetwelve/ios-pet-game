//
//  LeaderboardTableView.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/19/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "LeaderboardTableView.h"

@implementation LeaderboardTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Not currently used.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Not currently used.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Not currently used.
    NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    return cell;
}

@end