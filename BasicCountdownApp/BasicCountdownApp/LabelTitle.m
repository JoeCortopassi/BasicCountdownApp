//
//  LabelTitle.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/6/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "LabelTitle.h"

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
