//
//  LabelDescription.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/6/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "LabelDescription.h"

@implementation LabelDescription

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.frame = CGRectMake(0, 0, 0, 0);
        self.backgroundColor = [UIColor clearColor];
        self.textColor = [UIColor lightGrayColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:14.0f];
        self.text = @"";
        self.hidden = YES;
        
        
        // For visibility on differing backgrounds
        [self.layer setShadowColor:[UIColor whiteColor].CGColor];
        [self.layer setShadowOffset:CGSizeMake(0, 0)];
        [self.layer setShadowRadius:1.0];
        [self.layer setShadowOpacity:1.0];
        self.layer.shouldRasterize = YES;
//        [self.layer setMasksToBounds:NO];
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
