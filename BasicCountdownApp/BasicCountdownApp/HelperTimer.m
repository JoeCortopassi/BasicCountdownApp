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





+ (CGRect) frameForTimer:(UILabel *)timer andDescription:(UILabel *)description basedOnPreviousTimer:(UILabel *)previousTimer andPreviousDescription:(UILabel *)previousDescription
{
    CGFloat offsetFromPrevious = 0.0f;
    CGFloat offsetToCurrent = 0.0f;
    CGFloat margin = 10;
    
    CGFloat previousTimerX = previousTimer.frame.origin.x;
    CGFloat previousTimerWidth = previousTimer.frame.size.width;
    CGFloat previousDescriptionX = previousDescription.frame.origin.x;
    CGFloat previousDescriptionWidth = previousDescription.frame.size.width;
    
    CGFloat timerWidth = timer.frame.size.width;
    CGFloat descriptionWidth = description.frame.size.width;
    
    
    if (previousTimerWidth > previousDescriptionWidth)
    {
        // Timer is wider
        offsetFromPrevious = previousTimerX + previousTimerWidth + margin;
    }
    else
    {
        // Description is wider
        offsetFromPrevious = previousDescriptionX + previousDescriptionWidth + margin;
    }
    
    
    if (timerWidth > descriptionWidth)
    {
        offsetToCurrent = 0.0f;
    }
    else
    {
        offsetToCurrent = (descriptionWidth - timerWidth)/2;
    }
    
    
    return CGRectMake(offsetFromPrevious + offsetToCurrent,
                      timer.frame.origin.y,
                      timer.frame.size.width,
                      timer.frame.size.height);
}


+ (NSString *) stringFromDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM d, yyyy"];
    
    //Optionally for time zone converstions
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
    
    return [formatter stringFromDate:date];
}
@end
