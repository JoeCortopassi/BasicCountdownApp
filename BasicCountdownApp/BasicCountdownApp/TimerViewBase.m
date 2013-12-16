//
//  TimerViewBase.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/7/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "TimerViewBase.h"
#import "LabelTimer.h"
#import "LabelDescription.h"
#import "ObjectTimer.h"
#import "HelperTimer.h"





typedef enum {
    kYears,
    kMonths,
    kWeeks,
    kDays,
    kHours,
    kMinutes,
    kSeconds
} TimeUnit;




@interface TimerViewBase ()
@property (nonatomic, assign) TimerOrientation orientation;
@property (nonatomic, strong) NSTimer *timerRefresh;
@property (nonatomic, strong) ObjectTimer *timer;
@property (nonatomic, strong) LabelTimer *labelTimerYears;
@property (nonatomic, strong) LabelTimer *labelTimerMonths;
@property (nonatomic, strong) LabelTimer *labelTimerWeeks;
@property (nonatomic, strong) LabelTimer *labelTimerDays;
@property (nonatomic, strong) LabelTimer *labelTimerHours;
@property (nonatomic, strong) LabelTimer *labelTimerMinutes;
@property (nonatomic, strong) LabelTimer *labelTimerSeconds;
@property (nonatomic, strong) LabelDescription *labelDescriptionYears;
@property (nonatomic, strong) LabelDescription *labelDescriptionMonths;
@property (nonatomic, strong) LabelDescription *labelDescriptionWeeks;
@property (nonatomic, strong) LabelDescription *labelDescriptionDays;
@property (nonatomic, strong) LabelDescription *labelDescriptionHours;
@property (nonatomic, strong) LabelDescription *labelDescriptionMinutes;
@property (nonatomic, strong) LabelDescription *labelDescriptionSeconds;
@end



@implementation TimerViewBase

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        [self setupLabelTimer];
    }
    return self;
}



- (TimerOrientation) orientation
{
    return kHorizontal;
}



- (void) setupLabelTimer
{
    // Timers
    self.labelTimerYears    = [[LabelTimer alloc] init];
    [self addSubview:self.labelTimerYears];
    
    self.labelTimerMonths   = [[LabelTimer alloc] init];
    [self addSubview:self.labelTimerMonths];
    
    self.labelTimerWeeks    = [[LabelTimer alloc] init];
    [self addSubview:self.labelTimerWeeks];
    
    self.labelTimerDays     = [[LabelTimer alloc] init];
    [self addSubview:self.labelTimerDays];
    
    self.labelTimerHours    = [[LabelTimer alloc] init];
    [self addSubview:self.labelTimerHours];
    
    self.labelTimerMinutes  = [[LabelTimer alloc] init];
    [self addSubview:self.labelTimerMinutes];
    
    self.labelTimerSeconds  = [[LabelTimer alloc] init];
    [self addSubview:self.labelTimerSeconds];
    
    
    
    // Timer Descriptors
    self.labelDescriptionYears          = [[LabelDescription alloc] init];
    self.labelDescriptionYears.text     = @"Years";
    [self addSubview:self.labelDescriptionYears];
    
    self.labelDescriptionMonths         = [[LabelDescription alloc] init];
    self.labelDescriptionMonths.text    = @"Months";
    [self addSubview:self.labelDescriptionMonths];
    
    self.labelDescriptionWeeks          = [[LabelDescription alloc] init];
    self.labelDescriptionWeeks.text     = @"Weeks";
    [self addSubview:self.labelDescriptionWeeks];
    
    self.labelDescriptionDays           = [[LabelDescription alloc] init];
    self.labelDescriptionDays.text      = @"Days";
    [self addSubview:self.labelDescriptionDays];
    
    self.labelDescriptionHours          = [[LabelDescription alloc] init];
    self.labelDescriptionHours.text     = @"Hours";
    [self addSubview:self.labelDescriptionHours];
    
    self.labelDescriptionMinutes        = [[LabelDescription alloc] init];
    self.labelDescriptionMinutes.text   = @"Minutes";
    [self addSubview:self.labelDescriptionMinutes];
    
    self.labelDescriptionSeconds        = [[LabelDescription alloc] init];
    self.labelDescriptionSeconds.text   = @"Seconds";
    [self addSubview:self.labelDescriptionSeconds];
}


- (void) setDate:(NSDate *)newDate
{
    if (newDate == nil)
    {
        return;
    }
    
    _date = newDate;
    [self updateTimer];
    
    self.timerRefresh = [NSTimer scheduledTimerWithTimeInterval:1
                                                         target:self
                                                       selector:@selector(updateTimer)
                                                       userInfo:nil
                                                        repeats:YES];
}


- (void) setTimer:(ObjectTimer *)newTimer
{
    if (newTimer == nil)
    {
        return;
    }
 
    _timer = newTimer;
    
    [self displayTimerLabelsForTimer:newTimer];
    
    self.timerRefresh = [NSTimer scheduledTimerWithTimeInterval:1
                                                         target:self
                                                       selector:@selector(updateTimer)
                                                       userInfo:nil
                                                        repeats:YES];
}


- (void) updateTimer
{
    if (self.date == nil)
    {
        return;
    }
    
    [self displayTimerLabelsForTimer:[HelperTimer getCountdownTimerForDate:self.date]];
}




- (void) displayTimerLabelsForTimer:(ObjectTimer *)timer
{
    // Display the timer/description labels until we overflow the frame
    if (![self displayTimerLabelForUnit:kYears andTimer:timer]){ return; }
    if (![self displayTimerLabelForUnit:kMonths andTimer:timer]){ return; }
    if (![self displayTimerLabelForUnit:kWeeks andTimer:timer]){ return; }
    if (![self displayTimerLabelForUnit:kDays andTimer:timer]){ return; }
    if (![self displayTimerLabelForUnit:kHours andTimer:timer]){ return; }
    if (![self displayTimerLabelForUnit:kMinutes andTimer:timer]){ return; }
    if (![self displayTimerLabelForUnit:kSeconds andTimer:timer]){ return; }
}






- (BOOL) displayTimerLabelForUnit:(TimeUnit)timeUnit andTimer:(ObjectTimer *)timer
{
    LabelTimer *labelTimer;
    [self getLabelTimer:&labelTimer forTimeUnit:timeUnit andAddTextFromTimer:timer];
    
    LabelDescription *labelTimerDescription;
    [self getLabelTimerDescription:&labelTimerDescription ForTimeUnit:timeUnit];
    
    LabelTimer *labelTimerPrevious;
    [self getLabelTimerPrevious:&labelTimerPrevious ForTimeUnit:timeUnit];
    
    LabelDescription *labelTimerPreviousDescription;
    [self getLabelTimerDescriptionPrevious:&labelTimerPreviousDescription ForTimeUnit:timeUnit];
    
    int refreshRate = [self refreshRateForTimeUnit:timeUnit];
    
    
    
    BOOL positionReturn = [self positionTimer:labelTimer
                               andDescription:labelTimerDescription
                         basedOnPreviousTimer:labelTimerPrevious
                       andPreviousDescription:labelTimerPreviousDescription];
    
    if (!positionReturn)
    {
        return NO;
    }
    
    
    
    
    [self.timerRefresh invalidate];
    self.timerRefresh = [NSTimer scheduledTimerWithTimeInterval:refreshRate
                                                         target:self
                                                       selector:@selector(updateTimer)
                                                       userInfo:nil
                                                        repeats:YES];
    
    return YES;
}







/**************************************/
# pragma mark -
# pragma mark Label Positioning Methods
# pragma mark -
/**************************************/

- (BOOL) positionTimer:(LabelTimer *)labelTimer
        andDescription:(LabelDescription *)labelTimerDescription
  basedOnPreviousTimer:(LabelTimer *)labelTimerPrevious
andPreviousDescription:(LabelDescription *)labelTimerPreviousDescription
{
    if ((labelTimerPrevious.hidden == YES || labelTimerPrevious == nil) && ![labelTimer.text caseInsensitiveCompare:@"0"]==NSOrderedSame)
    {
        // First timer/description combo
        
        if (self.orientation == kHorizontal)
        {
            [self horizontalArrangeFirstTimer:labelTimer
                               andDescription:labelTimerDescription];
        }
        else
        {
            [self verticalArrangeFirstTimer:labelTimer
                             andDescription:labelTimerDescription];
        }
        
        self.outerWidthOfTimers = labelTimer.frame.origin.x + labelTimer.frame.size.width;
    }
    else if ((labelTimerPrevious.hidden == NO && labelTimerPrevious != nil) && ![labelTimer.text caseInsensitiveCompare:@"0"]==NSOrderedSame)
        
    {
        // Each additional timer/description combo
        if (self.orientation == kHorizontal)
        {
            [self horizontalArrangeAdditionalTimer:labelTimer
                                    andDescription:labelTimerDescription
                              basedOnPreviousTimer:labelTimerPrevious
                            andPreviousDescription:labelTimerPreviousDescription];
            
            if ([HelperTimer doesTimer:labelTimer orDescription:labelTimerDescription overflowForFrame:self.frame withMargin:45.0f])
            {
                // Last timer if they don't fit
                labelTimer.hidden = YES;
                labelTimerDescription.hidden = YES;
                
                return NO;
            }
            else
            {
                self.outerWidthOfTimers = labelTimer.frame.origin.x + labelTimer.frame.size.width;
            }
        }
        else
        {
            [self verticalArrangeAdditionalTimer:labelTimer
                                  andDescription:labelTimerDescription
                            basedOnPreviousTimer:labelTimerPrevious
                          andPreviousDescription:labelTimerPreviousDescription];
        }
        
        
    }
    else if ((labelTimerPrevious.hidden == NO && labelTimerPrevious != nil) && [labelTimer.text caseInsensitiveCompare:@"0"]==NSOrderedSame)
        
    {
        [self hideTimer:labelTimer andDescription:labelTimerDescription basedOnPreviousTimer:labelTimerPrevious andPreviousDescription:labelTimerPreviousDescription];
        
//        return YES;
    }
    else if ((labelTimerPrevious.hidden == YES || labelTimerPrevious == nil) && [labelTimer.text caseInsensitiveCompare:@"0"]==NSOrderedSame)
    {
        // First timer/description hasn't been found yet, AND this one isn't it either
        // Do nothing. Timer and combo are already hidden
    }
    else
    {
        NSLog(@"%s [Line %d] %@ ", __PRETTY_FUNCTION__, __LINE__, @"");
    }
    
    return YES;
}


// Horizontal Arrangements

- (void) horizontalArrangeFirstTimer:(LabelTimer *)timer andDescription:(LabelDescription *)description
{
    timer.frame = CGRectMake(20,
                             0,
                             30,
                             30);
    timer.hidden = NO;
    //timer.backgroundColor = [UIColor blueColor];
    [timer sizeToFit];
    
    [description sizeToFit];
    description.center = CGPointMake(timer.center.x, timer.center.y + 20);
    description.hidden = NO;
}


- (void) horizontalArrangeAdditionalTimer:(LabelTimer *)labelTimer andDescription:(LabelDescription *)labelTimerDescription basedOnPreviousTimer:(LabelTimer *)labelTimerPrevious andPreviousDescription:(LabelDescription *)labelTimerPreviousDescription
{
    
    labelTimer.frame = CGRectMake(0,
                                  0,
                                  30,
                                  30);
    [labelTimer sizeToFit];
    labelTimer.hidden = NO;
    
    [labelTimerDescription sizeToFit];
    labelTimerDescription.hidden = NO;
    
    
    CGRect newTimerFrame = [HelperTimer frameForTimer:labelTimer andDescription:labelTimerDescription basedOnPreviousTimer:labelTimerPrevious andPreviousDescription:labelTimerPreviousDescription];
    labelTimer.frame = newTimerFrame;
    labelTimerDescription.center = CGPointMake(labelTimer.center.x, labelTimer.center.y + 20);
}



// Vertical arrangements

- (void) verticalArrangeFirstTimer:(LabelTimer *)timer andDescription:(LabelDescription *)description
{
    timer.frame = CGRectMake(20,
                             0,
                             30,
                             30);
    timer.hidden = NO;
    //timer.backgroundColor = [UIColor blueColor];
    [timer sizeToFit];
    
    [description sizeToFit];
    description.center = CGPointMake(timer.center.x, timer.center.y + 20);
    description.hidden = NO;
}


- (void) verticalArrangeAdditionalTimer:(LabelTimer *)labelTimer andDescription:(LabelDescription *)labelTimerDescription basedOnPreviousTimer:(LabelTimer *)labelTimerPrevious andPreviousDescription:(LabelDescription *)labelTimerPreviousDescription
{
    
    labelTimer.frame = CGRectMake(0,
                                  0,
                                  30,
                                  30);
    [labelTimer sizeToFit];
    labelTimer.hidden = NO;
    
    [labelTimerDescription sizeToFit];
    labelTimerDescription.hidden = NO;
    
    
    CGRect newTimerFrame = [HelperTimer frameForTimer:labelTimer andDescription:labelTimerDescription basedOnPreviousTimer:labelTimerPrevious andPreviousDescription:labelTimerPreviousDescription];
    labelTimer.frame = newTimerFrame;
    labelTimerDescription.center = CGPointMake(labelTimer.center.x, labelTimer.center.y + 20);
}


- (void) hideTimer:(LabelTimer *)labelTimer andDescription:(LabelDescription *)labelTimerDescription basedOnPreviousTimer:(LabelTimer *)labelTimerPrevious andPreviousDescription:(LabelDescription *)labelTimerPreviousDescription
{
    // Whatever timer in between the first and last one, that has a zero value and is thus hidden
    labelTimer.frame = CGRectMake(labelTimerPrevious.frame.origin.x,
                                  -20000,
                                  labelTimerPrevious.frame.size.width,
                                  labelTimerPrevious.frame.size.height);
    labelTimer.hidden = NO;
    
    labelTimerDescription.frame = CGRectMake(labelTimerPreviousDescription.frame.origin.x,
                                             -20000,
                                             labelTimerPreviousDescription.frame.size.width,
                                             labelTimerPreviousDescription.frame.size.height);
    labelTimer.hidden = NO;
}






/**************************************/
# pragma mark -
# pragma mark Label Discovery Methods
# pragma mark -
/**************************************/

- (void) getLabelTimer:(LabelTimer **)labelTimer forTimeUnit:(TimeUnit)timeUnit andAddTextFromTimer:(ObjectTimer *)timer
{
    if (timeUnit == kYears)
    {
        self.labelTimerYears.text = [NSString stringWithFormat:@"%i", timer.years];
        *labelTimer = self.labelTimerYears;
    }
    else if (timeUnit == kMonths)
    {
        self.labelTimerMonths.text = [NSString stringWithFormat:@"%i", timer.months];
        *labelTimer = self.labelTimerMonths;
    }
    else if (timeUnit == kWeeks)
    {
        self.labelTimerWeeks.text = [NSString stringWithFormat:@"%i", timer.weeks];
        *labelTimer = self.labelTimerWeeks;
    }
    else if (timeUnit == kDays)
    {
        self.labelTimerDays.text = [NSString stringWithFormat:@"%i", timer.days];
        *labelTimer = self.labelTimerDays;
    }
    else if (timeUnit == kHours)
    {
        self.labelTimerHours.text = [NSString stringWithFormat:@"%i", timer.hours];
        *labelTimer = self.labelTimerHours;
    }
    else if (timeUnit == kMinutes)
    {
        self.labelTimerMinutes.text = [NSString stringWithFormat:@"%i", timer.minutes];
        *labelTimer = self.labelTimerMinutes;
    }
    else if (timeUnit == kSeconds)
    {
        self.labelTimerSeconds.text = [NSString stringWithFormat:@"%i", timer.seconds];
        *labelTimer = self.labelTimerSeconds;
    }
    else
    {
        // Error: Method called without a proper time unit given
        NSLog(@"%s [Line %d] %@ ", __PRETTY_FUNCTION__, __LINE__, @"Proper time unit not given");
    }
    
}


- (void) getLabelTimerDescription:(LabelDescription **)labelTimerDescription ForTimeUnit:(TimeUnit) timeUnit
{
    if (timeUnit == kYears)
    {
        *labelTimerDescription = self.labelDescriptionYears;
    }
    else if (timeUnit == kMonths)
    {
        *labelTimerDescription = self.labelDescriptionMonths;
    }
    else if (timeUnit == kWeeks)
    {
        *labelTimerDescription = self.labelDescriptionWeeks;
    }
    else if (timeUnit == kDays)
    {
        *labelTimerDescription = self.labelDescriptionDays;
    }
    else if (timeUnit == kHours)
    {
        *labelTimerDescription = self.labelDescriptionHours;
    }
    else if (timeUnit == kMinutes)
    {
        *labelTimerDescription = self.labelDescriptionMinutes;
    }
    else if (timeUnit == kSeconds)
    {
        *labelTimerDescription = self.labelDescriptionSeconds;
    }
    else
    {
        // Error: Method called without a proper time unit given
        NSLog(@"%s [Line %d] %@ ", __PRETTY_FUNCTION__, __LINE__, @"Proper time unit not given");
    }
}


- (void) getLabelTimerPrevious:(LabelTimer **)labelTimerPrevious ForTimeUnit:(TimeUnit)timeUnit
{
    if (timeUnit == kYears)
    {
        *labelTimerPrevious = nil;
    }
    else if (timeUnit == kMonths)
    {
        *labelTimerPrevious = self.labelTimerYears;
    }
    else if (timeUnit == kWeeks)
    {
        *labelTimerPrevious = self.labelTimerMonths;
    }
    else if (timeUnit == kDays)
    {
        *labelTimerPrevious = self.labelTimerWeeks;
    }
    else if (timeUnit == kHours)
    {
        *labelTimerPrevious = self.labelTimerDays;
    }
    else if (timeUnit == kMinutes)
    {
        *labelTimerPrevious = self.labelTimerHours;
    }
    else if (timeUnit == kSeconds)
    {
        *labelTimerPrevious = self.labelTimerMinutes;
    }
    else
    {
        // Error: Method called without a proper time unit given
        NSLog(@"%s [Line %d] %@ ", __PRETTY_FUNCTION__, __LINE__, @"Proper time unit not given");
    }
}


- (void) getLabelTimerDescriptionPrevious:(LabelDescription **)labelTimerDescriptionPrevious ForTimeUnit:(TimeUnit)timeUnit
{
    if (timeUnit == kYears)
    {
        *labelTimerDescriptionPrevious = nil;
    }
    else if (timeUnit == kMonths)
    {
        *labelTimerDescriptionPrevious = self.labelDescriptionYears;
    }
    else if (timeUnit == kWeeks)
    {
        *labelTimerDescriptionPrevious = self.labelDescriptionMonths;
    }
    else if (timeUnit == kDays)
    {
        *labelTimerDescriptionPrevious = self.labelDescriptionWeeks;
    }
    else if (timeUnit == kHours)
    {
        *labelTimerDescriptionPrevious = self.labelDescriptionDays;
    }
    else if (timeUnit == kMinutes)
    {
        *labelTimerDescriptionPrevious = self.labelDescriptionHours;
    }
    else if (timeUnit == kSeconds)
    {
        *labelTimerDescriptionPrevious = self.labelDescriptionMinutes;
    }
    else
    {
        // Error: Method called without a proper time unit given
        NSLog(@"%s [Line %d] %@ ", __PRETTY_FUNCTION__, __LINE__, @"Proper time unit not given");
    }
}


- (int) refreshRateForTimeUnit:(TimeUnit)timeUnit
{
    int refreshRate;
    
    if (timeUnit == kMinutes)
    {
        refreshRate = 1;
    }
    else if (timeUnit == kSeconds)
    {
        refreshRate = 1;
    }
    else
    {
        // default value
        refreshRate = 120;
    }
    
    
    return refreshRate;
}



@end
