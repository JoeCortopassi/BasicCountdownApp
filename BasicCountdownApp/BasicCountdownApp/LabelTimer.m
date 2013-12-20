//
//  LabelTimer.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/6/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "LabelTimer.h"

@implementation LabelTimer

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.frame = CGRectMake(0, 0, 0, 0);
        self.backgroundColor = [UIColor clearColor];
        self.textColor = [UIColor darkGrayColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:28.0f];
        self.text = @"0";
        self.hidden = YES;
        
        // For visibility on differing backgrounds
        [self.layer setShadowColor:[UIColor whiteColor].CGColor];
        [self.layer setShadowOffset:CGSizeMake(0, 0)];
        [self.layer setShadowRadius:1.0];
        [self.layer setShadowOpacity:1.0];
        [self.layer setMasksToBounds:NO];
    }
    return self;
}

@end
