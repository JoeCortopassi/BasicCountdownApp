//
//  CountdownTimerCell.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 11/24/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "CountdownTimerCell.h"
#import "ObjectTimer.h"





typedef enum {
    kYears,
    kMonths,
    kWeeks,
    kDays,
    kHours,
    kMinutes,
    kSeconds
} TimeUnit;





@interface CountdownTimerCell ()
@property (nonatomic, strong) NSTimer *timerRefresh;
@property (nonatomic, strong) UIImageView *viewBackgroundImage;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelTimerYears;
@property (nonatomic, strong) UILabel *labelTimerMonths;
@property (nonatomic, strong) UILabel *labelTimerWeeks;
@property (nonatomic, strong) UILabel *labelTimerDays;
@property (nonatomic, strong) UILabel *labelTimerHours;
@property (nonatomic, strong) UILabel *labelTimerMinutes;
@property (nonatomic, strong) UILabel *labelTimerSeconds;
@property (nonatomic, strong) UILabel *labelDescriptionYears;
@property (nonatomic, strong) UILabel *labelDescriptionMonths;
@property (nonatomic, strong) UILabel *labelDescriptionWeeks;
@property (nonatomic, strong) UILabel *labelDescriptionDays;
@property (nonatomic, strong) UILabel *labelDescriptionHours;
@property (nonatomic, strong) UILabel *labelDescriptionMinutes;
@property (nonatomic, strong) UILabel *labelDescriptionSeconds;
@end





@implementation CountdownTimerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        [self setupViewBackgroundImage];
        [self setupLabelTitle];
        [self setupLabelTimer];
    }
    
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setAlpha:(CGFloat)alpha {
    [super setAlpha:1.0f];
}


- (void) setCountdown:(ObjectCountdown *)newCountdown
{
    self.labelTitle.text = newCountdown.title;
    _countdown = newCountdown;
    
    self.timerRefresh = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                         target:self
                                                       selector:@selector(updateTimer)
                                                       userInfo:nil
                                                        repeats:YES];
    
    
    
    
    
    
    NSDate *endingDate = newCountdown.dateOfEvent;
    NSDate *startingDate = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:startingDate toDate:endingDate options:0];
    
    NSInteger days     = [dateComponents day];
    NSInteger months   = [dateComponents month];
    NSInteger years    = [dateComponents year];
    NSInteger hours    = [dateComponents hour];
    NSInteger minutes  = [dateComponents minute];
    NSInteger seconds  = [dateComponents second];
}



/**************************************/
# pragma mark -
# pragma mark Setup Methods
# pragma mark -
/**************************************/
- (void) setupViewBackgroundImage
{
    // User set image
    // white overlay with a 0.1 alpha to wash it out a little bit (maybe?)
}


- (void) setupLabelTitle
{
    CGFloat inset = 8.0f;
    
    self.labelTitle = [[UILabel alloc] init];
    self.labelTitle.frame = CGRectMake(inset, inset, [[UIScreen mainScreen] bounds].size.width - (inset*2), 40);
//    self.labelTitle.backgroundColor = [UIColor orangeColor];
    [self.labelTitle setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:45.0f]];
    self.labelTitle.text = @"Christmas";
    
    [self addSubview:self.labelTitle];
}


- (void) setupLabelTimer
{
    // Timers
    self.labelTimerYears    = [self labelCreateGenericTimer];
    self.labelTimerMonths   = [self labelCreateGenericTimer];
    self.labelTimerWeeks    = [self labelCreateGenericTimer];
    self.labelTimerDays     = [self labelCreateGenericTimer];
    self.labelTimerHours    = [self labelCreateGenericTimer];
    self.labelTimerMinutes  = [self labelCreateGenericTimer];
    self.labelTimerSeconds  = [self labelCreateGenericTimer];
    
    
    // Timer Descriptors
    self.labelDescriptionYears          = [self labelCreateGenericTimerDescription];
    self.labelDescriptionYears.text     = @"Years";
    
    self.labelDescriptionMonths         = [self labelCreateGenericTimerDescription];
    self.labelDescriptionMonths.text    = @"Months";
    
    self.labelDescriptionWeeks          = [self labelCreateGenericTimerDescription];
    self.labelDescriptionWeeks.text     = @"Weeks";
    
    self.labelDescriptionDays           = [self labelCreateGenericTimerDescription];
    self.labelDescriptionDays.text      = @"Days";
    
    self.labelDescriptionHours          = [self labelCreateGenericTimerDescription];
    self.labelDescriptionHours.text     = @"Hours";
    
    self.labelDescriptionMinutes        = [self labelCreateGenericTimerDescription];
    self.labelDescriptionMinutes.text   = @"Minutes";
    
    self.labelDescriptionSeconds        = [self labelCreateGenericTimerDescription];
    self.labelDescriptionSeconds.text   = @"Seconds";
}


- (UILabel *) labelCreateGenericTimer
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 0, 0);
//    label.backgroundColor = [UIColor yellowColor];
    label.textColor = [UIColor darkGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:28.0f];
    label.text = @"0";
    label.hidden = YES;
    
    [self addSubview:label];
    
    return label;
}


- (UILabel *) labelCreateGenericTimerDescription
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 0, 0);
//    label.backgroundColor = [UIColor greenColor];
    label.textColor = [UIColor lightGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:14.0f];
    label.text = @"";
    label.hidden = YES;
    
    [self addSubview:label];
    
    return label;
}



/**************************************/
# pragma mark -
# pragma mark Timer Methods
# pragma mark -
/**************************************/

- (void) updateTimer
{
    if (self.countdown == nil)
    {
        return;
    }
    
    NSDateComponents *dateDifference = [self getDifferenceBetweenCountdownAndToday];

    ObjectTimer *timer = [[ObjectTimer alloc] init];
    timer.years   = [dateDifference year];
    timer.months  = [dateDifference month];
    timer.weeks   = 0;//[dateDifference weekOfMonth];
    timer.days    = [dateDifference day];
    timer.hours   = [dateDifference hour];
    timer.minutes = [dateDifference minute];
    timer.seconds = [dateDifference second];
    
    [self displayTimerLabelsForTimer:timer];
}


- (NSDateComponents *) getDifferenceBetweenCountdownAndToday
{
//    NSDate *toDateTime = self.countdown.dateOfEvent;
//    NSDate *fromDateTime = [NSDate date];
//    NSDate *fromDate;
//    NSDate *toDate;
//    
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    
//    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
//                 interval:NULL forDate:fromDateTime];
//    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
//                 interval:NULL forDate:toDateTime];
//    
//    NSUInteger unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
//    
//    NSDateComponents *difference = [calendar components:unitFlags
//                                               fromDate:fromDate
//                                                 toDate:toDate
//                                                options:NSWrapCalendarComponents];
//    
    
    NSDate *endingDate = self.countdown.dateOfEvent;
    NSDate *startingDate = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:startingDate toDate:endingDate options:0];
    
    
    return dateComponents;
}


- (int) getRemainingTimeForTimeUnit:(TimeUnit)unit
{
    return rand() % (10 - 0) + 0;
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


#warning This method is a mess. Needs to be refactored
- (BOOL) displayTimerLabelForUnit:(TimeUnit)timeUnit andTimer:(ObjectTimer *)timer
{
    UILabel *labelTimer;
    [self getLabelTimer:&labelTimer forTimeUnit:timeUnit andAddTextFromTimer:timer];
    
    UILabel *labelTimerDescription;
    [self getLabelTimerDescription:&labelTimerDescription ForTimeUnit:timeUnit];
    
    UILabel *labelTimerPrevious;
    [self getLabelTimerPrevious:&labelTimerPrevious ForTimeUnit:timeUnit];
    
    UILabel *labelTimerPreviousDescription;
    [self getLabelTimerDescriptionPrevious:&labelTimerPreviousDescription ForTimeUnit:timeUnit];
    
    int refreshRate = [self refreshRateForTimeUnit:timeUnit];
    
    
    
    
    if ((labelTimerPrevious.hidden == YES || labelTimerPrevious == nil) && ![labelTimer.text caseInsensitiveCompare:@"0"]==NSOrderedSame)
    {
        // First timer/description combo
        
        labelTimer.frame = CGRectMake(20,
                                      50,
                                      30,
                                      30);
        labelTimer.hidden = NO;
//        labelTimer.backgroundColor = [UIColor blueColor];
        [labelTimer sizeToFit];
        
        [labelTimerDescription sizeToFit];
        labelTimerDescription.center = CGPointMake(labelTimer.center.x, labelTimer.center.y + 20);
        labelTimerDescription.hidden = NO;
    }
    else if ((labelTimerPrevious.hidden == NO && labelTimerPrevious != nil) && ![labelTimer.text caseInsensitiveCompare:@"0"]==NSOrderedSame)

    {
        // Each additional timer/description combo
        
        labelTimer.frame = CGRectMake(0,
                                      50,
                                      30,
                                      30);
        [labelTimer sizeToFit];
        labelTimer.hidden = NO;
        
        [labelTimerDescription sizeToFit];
        labelTimerDescription.hidden = NO;
        
        
        CGRect newTimerFrame = [self frameForTimer:labelTimer andDescription:labelTimerDescription basedOnPreviousTimer:labelTimerPrevious andPreviousDescription:labelTimerPreviousDescription];
        labelTimer.frame = newTimerFrame;
        labelTimerDescription.center = CGPointMake(labelTimer.center.x, labelTimer.center.y + 20);
        
        if ([self isOverflowedFrameForTimer:labelTimer orDescription:labelTimerDescription])
        {
            // Last timer if they don't fit
            labelTimer.hidden = YES;
            labelTimerDescription.hidden = YES;
            
            return NO;
        }
    }
    else if ((labelTimerPrevious.hidden == NO && labelTimerPrevious != nil) && [labelTimer.text caseInsensitiveCompare:@"0"]==NSOrderedSame)
        
    {
        // Whatever timer in between the first and last one, that has a zero value and is thus hidden
        labelTimer.frame = CGRectMake(labelTimerPrevious.frame.origin.x,
                                      -200,
                                      labelTimerPrevious.frame.size.width,
                                      labelTimerPrevious.frame.size.height);
        labelTimer.hidden = NO;
        
        labelTimerDescription.frame = CGRectMake(labelTimerPreviousDescription.frame.origin.x,
                                      -200,
                                      labelTimerPreviousDescription.frame.size.width,
                                      labelTimerPreviousDescription.frame.size.height);
        labelTimer.hidden = NO;
        
        return YES;
    }
    else
    {
        
    }
    
    
    [self.timerRefresh invalidate];
    self.timerRefresh = nil;
    self.timerRefresh = [NSTimer scheduledTimerWithTimeInterval:refreshRate
                                                         target:self
                                                       selector:@selector(updateTimer)
                                                       userInfo:nil
                                                        repeats:YES];
    
    return YES;
}


- (CGRect) frameForTimer:(UILabel *)timer andDescription:(UILabel *)description basedOnPreviousTimer:(UILabel *)previousTimer andPreviousDescription:(UILabel *)previousDescription
{
    CGFloat offsetFromPrevious = 0.0f;
    CGFloat offsetToCurrent = 0.0f;
    CGFloat margin = 10;
    
    CGFloat previousTimerX = previousTimer.frame.origin.x;
    CGFloat previousTimerWidth = previousTimer.frame.size.width;
    CGFloat previousDescriptionX = previousDescription.frame.origin.x;
    CGFloat previousDescriptionWidth = previousDescription.frame.size.width;
    
    CGFloat timerX = timer.frame.origin.x;
    CGFloat timerWidth = timer.frame.size.width;
    CGFloat descriptionX = description.frame.origin.x;
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


- (BOOL) isOverflowedFrameForTimer:(UILabel *)timer orDescription:(UILabel *)description
{
    CGFloat rightMargin = 45.0f;
    CGFloat cellWidth = self.frame.size.width;
    
    
    if ((timer.frame.origin.x + timer.frame.size.width + rightMargin) > cellWidth)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


- (void) getLabelTimer:(UILabel **)labelTimer forTimeUnit:(TimeUnit)timeUnit andAddTextFromTimer:(ObjectTimer *)timer
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


- (void) getLabelTimerDescription:(UILabel **)labelTimerDescription ForTimeUnit:(TimeUnit) timeUnit
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


- (void) getLabelTimerPrevious:(UILabel **)labelTimerPrevious ForTimeUnit:(TimeUnit)timeUnit
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


- (void) getLabelTimerDescriptionPrevious:(UILabel **)labelTimerDescriptionPrevious ForTimeUnit:(TimeUnit)timeUnit
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
        refreshRate = 15;
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