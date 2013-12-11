//
//  ModelCountdown.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/6/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "ModelCountdown.h"

@implementation ModelCountdown
- (NSArray *) getAllCountdowns
{
    ObjectCountdown *countdown1 = [[ObjectCountdown alloc] init];
    countdown1.dateOfEvent = [NSDate dateWithTimeIntervalSince1970:1387929600];
    countdown1.title = @"Christmas";
    
    ObjectCountdown *countdown2 = [[ObjectCountdown alloc] init];
    countdown2.dateOfEvent = [NSDate dateWithTimeIntervalSince1970:1388534400];
    countdown2.title = @"New Years";
    
    ObjectCountdown *countdown3 = [[ObjectCountdown alloc] init];
    countdown3.dateOfEvent = [NSDate dateWithTimeIntervalSince1970:1392336000];
    countdown3.title = @"Valentine's";
    
    ObjectCountdown *countdown4 = [[ObjectCountdown alloc] init];
    countdown4.dateOfEvent = [NSDate dateWithTimeIntervalSince1970:1401062400];
    countdown4.title = @"Memorial Day";
    
    ObjectCountdown *countdown5 = [[ObjectCountdown alloc] init];
    countdown5.dateOfEvent = [NSDate dateWithTimeIntervalSince1970:1404432000];
    countdown5.title = @"4th of July";
    
    ObjectCountdown *countdown6 = [[ObjectCountdown alloc] init];
    countdown6.dateOfEvent = [NSDate dateWithTimeIntervalSince1970:1414713600];
    countdown6.title = @"Halloween";
    
    
    return @[countdown1, countdown2, countdown3, countdown4, countdown5, countdown6];
}
@end
