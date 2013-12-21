//
//  EditTitleView.m
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/20/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "EditTitleView.h"

@implementation EditTitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CGRect bounds = [[UIScreen mainScreen] bounds];
        self.frame = CGRectMake(0, 0, bounds.size.width - 20, 200);
        self.backgroundColor = [UIColor clearColor];
        
        [self setupViewStyle];
    }
    return self;
}


- (void) setupViewStyle
{
    UIView *background = [[UIView alloc] init];
    background.frame = self.frame;
    background.backgroundColor = [UIColor whiteColor];
    background.layer.cornerRadius = 5;
    background.clipsToBounds = YES;
    [self addSubview:background];
    
    [self.layer setShadowOffset:CGSizeMake(1, 2)];
    [self.layer setShadowRadius:5.0];
    [self.layer setShadowOpacity:0.5];
}


@end
