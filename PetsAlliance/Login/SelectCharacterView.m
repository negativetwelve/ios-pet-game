//
//  SelectCharacterView.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/23/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "SelectCharacterView.h"

@implementation SelectCharacterView
@synthesize index = _index;
@synthesize viewController = _viewController;
@synthesize male = _male;
@synthesize female = _female;
@synthesize maleButton = _maleButton;
@synthesize femaleButton = _femaleButton;
@synthesize nextButton = _nextButton;
@synthesize prevButton = _prevButton;
@synthesize character = _character;
@synthesize selectButton = _selectButton;


- (id)initWithFrame:(CGRect)frame andIndex:(int)inputIndex {
    self = [self initWithFrame:frame];
    self.index = inputIndex;
    return self;
}

- (id)initWithFrame:(CGRect)frame andIndex:(int)inputIndex andImage:(NSString *)inputImage {
    self = [super initWithFrame:frame];
    if (self) {
        self.nuiClass = @"DefaultView";
        
        UIImageView *nextButtonView = [[UIImageView alloc] initWithFrame:CGRectMake(260, 100, 60, 60)];
        [nextButtonView setImage:[FontAwesomeKit imageForIcon:FAKIconAngleRight imageSize:CGSizeMake(60, 60) fontSize:50 attributes:nil]];
        [self addSubview:nextButtonView];
        [self setNextButton:nextButtonView];

        UIImageView *prevButtonView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 60, 60)];
        [prevButtonView setImage:[FontAwesomeKit imageForIcon:FAKIconAngleLeft imageSize:CGSizeMake(60, 60) fontSize:50 attributes:nil]];
        [self addSubview:prevButtonView];
        [self setPrevButton:prevButtonView];
        
        if (inputIndex == 0) {
            UIImageView *maleChar = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 120, 240)];
            [maleChar setImage:[UIImage imageNamed:@"male1.png"]];
            [self addSubview:maleChar];
            
            UIImageView *femaleChar = [[UIImageView alloc] initWithFrame:CGRectMake(180, 10, 120, 240)];
            [femaleChar setImage:[UIImage imageNamed:@"female1.png"]];
            [self addSubview:femaleChar];
            
            self.male = maleChar;
            self.female = femaleChar;
            [nextButtonView setHidden:YES];
            [prevButtonView setHidden:YES];
        } else {
            UIImageView *newCharacter = [[UIImageView alloc] initWithFrame:CGRectMake(100, 10, 120, 240)];
            [newCharacter setImage:[UIImage imageNamed:inputImage]];
            [self addSubview:newCharacter];
            [self setCharacter:newCharacter];
        }
        
        self.index = inputIndex;
    }
    return self;
}

- (void)setMaleAndFemale {
    [self.viewController setMale:self.male];
    [self.viewController setFemale:self.female];
    [self.viewController setNextButton:self.nextButton];
}

@end
