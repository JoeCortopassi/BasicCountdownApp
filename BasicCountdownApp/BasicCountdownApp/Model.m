//
//  Model.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/6/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "Model.h"

@implementation Model
- (id) init
{
    if ((self = [super init]))
    {
        self.countdown = [[ModelCountdown alloc] init];
    }
    
    
    return self;
}
@end
