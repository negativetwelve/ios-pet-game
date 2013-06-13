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

- (id)initWithTitle: (NSString*)titleText AndFont:(UIFont*)textFont
                                      AndTextColor:(UIColor*)textFontColor
                                      AndBackgroundColor:(UIColor*)backColor
                                      AndXPos:(int)xPos
                                      AndYPos:(int)yPos
                                      AndWidth:(int)width
                                      AndHeight:(int)height {
    self = [super initWithFrame:CGRectMake(xPos, yPos, width, height)];
    self.text = titleText;
    self.font = textFont;
    self.textColor = textFontColor;
    self.backgroundColor = backColor;
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
