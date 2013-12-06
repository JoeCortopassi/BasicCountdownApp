//
//  HelperTimer.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/6/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "HelperTimer.h"
#import "LabelTimer.h"
#import "LabelDescription.h"
#import "ObjectTimer.h"

@implementation HelperTimer
+ (ObjectTimer *) getCountdownTimerForDate:(NSDate *)date;
{
    NSDate *endingDate = date;
    NSDate *startingDate = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents *dateDifference = [calendar components:unitFlags fromDate:startingDate toDate:endingDate options:0];
    
    
    ObjectTimer *timer = [[ObjectTimer alloc] init];
    timer.years   = [dateDifference year];
    timer.months  = [dateDifference month];
    timer.weeks   = 0;//[dateDifference weekOfMonth];
    timer.days    = [dateDifference day];
    timer.hours   = [dateDifference hour];
    timer.minutes = [dateDifference minute];
    timer.seconds = [dateDifference second];
    
    return timer;
}


+ (BOOL)doesTimer:(LabelTimer *)timer orDescription:(LabelDescription *)description overflowForFrame:(CGRect)frame withMargin:(CGFloat)margin
{
    if ((timer.frame.origin.x + timer.frame.size.width + margin) > frame.size.width)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
@end
