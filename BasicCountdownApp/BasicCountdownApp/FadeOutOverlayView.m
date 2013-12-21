//
//  FadeOutOverlayView.m
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/20/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "FadeOutOverlayView.h"

@implementation FadeOutOverlayView

- (id) init
{
    if (self = [super init])
    {
        self.frame = [[UIScreen mainScreen] bounds];
        self.opacity = 0.7;
        self.alpha = self.opacity;
        self.backgroundColor = [UIColor blackColor];
    }
    
    
    return self;
}

@end
