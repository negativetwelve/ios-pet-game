//
//  PetStatusView.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/11/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "PetStatusView.h"

@implementation PetStatusView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];

        // Labels for the status view
        UIFont *statusFont = [UIFont systemFontOfSize:12];
        
        StatusLabel *hpLabel = [[StatusLabel alloc] initWithTitle:@"HP" AndFont:statusFont AndTextColor:[UIColor whiteColor] AndBackgroundColor:[UIColor clearColor]
                                                                        AndXPos:10 AndYPos:20 AndWidth:50 AndHeight:20];
        [self addSubview: hpLabel];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
