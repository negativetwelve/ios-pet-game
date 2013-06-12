//
//  StatusLabel.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/12/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "StatusLabel.h"

@implementation StatusLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithTitle: (NSString*)title AndFont:(UIFont*)font
                                      AndTextColor:(UIColor*)textColor
                                      AndBackgroundColor:(UIColor*)backgroundColor
                                      AndXPos:(int)xPos
                                      AndYPos:(int)yPos
                                      AndWidth:(int)width
                                      AndHeight:(int)height {
    self = [super initWithFrame:CGRectMake(xPos, yPos, width, height)];
    self.text = title;
    self.font = font;
    self.textColor = textColor;
    self.backgroundColor = backgroundColor;
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
