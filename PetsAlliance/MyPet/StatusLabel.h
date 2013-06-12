//
//  StatusLabel.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/12/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusLabel : UILabel {
    NSString *title;
    int xPos;
    int yPos;
    int height;
    int width;
    UIFont *font;
    UIColor *textColor;
    UIColor *backgroundColor;
}

- (id)initWithTitle: (NSString*)title AndFont:(UIFont*)font AndTextColor:(UIColor*)textColor AndBackgroundColor:(UIColor*)backgroundColor AndXPos:(int)xPos AndYPos:(int)yPos AndWidth:(int)width AndHeight:(int)height;

@end
