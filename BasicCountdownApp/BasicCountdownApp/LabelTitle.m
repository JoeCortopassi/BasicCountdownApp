//
//  LabelTitle.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/6/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "LabelTitle.h"
#import <QuartzCore/QuartzCore.h>

@implementation LabelTitle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        CGFloat inset = 8.0f;
        self.backgroundColor = [UIColor clearColor];
        self.frame = CGRectMake(inset, inset, [[UIScreen mainScreen] bounds].size.width - (inset*2), 40);
        [self setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:45.0f]];
        self.numberOfLines = 1;
        self.adjustsFontSizeToFitWidth = YES;
        self.clipsToBounds = NO;
        
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



@end
