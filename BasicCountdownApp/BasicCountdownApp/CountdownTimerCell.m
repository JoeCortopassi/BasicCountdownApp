//
//  CountdownTimerCell.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 11/24/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "CountdownTimerCell.h"
#import "CountdownViewController.h"
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





@interface CountdownTimerCell ()
@property (nonatomic, strong) NSTimer *timerRefresh;
@property (nonatomic, strong) UIImageView *viewBackgroundImage;
@property (nonatomic, strong) UILabel *labelTitle;
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
@property (nonatomic, strong) UIButton *buttonOverlay;
@end





@implementation CountdownTimerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
    }
    
    
    return self;
}


- (void) layoutSubviews
{
    [self setupViewBackgroundImage];
    [self setupLabelTitle];
    [self setupLabelTimer];
    [self setupButtonOverlay];
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
    [self.labelTitle setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:45.0f]];
    self.labelTitle.text = self.countdown.title;
    
    [self addSubview:self.labelTitle];
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

//
//- (UILabel *) labelCreateGenericTimer
//{
//    UILabel *label = [[UILabel alloc] init];
//    label.frame = CGRectMake(0, 0, 0, 0);
//    label.textColor = [UIColor darkGrayColor];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:28.0f];
//    label.text = @"0";
//    label.hidden = YES;
//    
//    [self addSubview:label];
//    
//    return label;
//}
//
//
//- (UILabel *) labelCreateGenericTimerDescription
//{
//    UILabel *label = [[UILabel alloc] init];
//    label.frame = CGRectMake(0, 0, 0, 0);
//    label.textColor = [UIColor lightGrayColor];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:14.0f];
//    label.text = @"";
//    label.hidden = YES;
//    
//    [self addSubview:label];
//    
//    return label;
//}


- (void) setupButtonOverlay
{
    self.buttonOverlay = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonOverlay.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.buttonOverlay setTitle:@"" forState:UIControlStateNormal];
    [self.buttonOverlay addTarget:self action:@selector(buttonOverlaySelected) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.buttonOverlay];
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
    
    [self displayTimerLabelsForTimer:[HelperTimer getCountdownTimerForDate:self.countdown.dateOfEvent]];
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
        
        if ([HelperTimer doesTimer:labelTimer orDescription:labelTimerDescription overflowForFrame:self.frame withMargin:45.0f])
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
//
//
//- (BOOL) isOverflowedFrameForTimer:(UILabel *)timer orDescription:(UILabel *)description
//{
//    CGFloat rightMargin = 45.0f;
//    CGFloat cellWidth = self.frame.size.width;
//    
//    
//    if ((timer.frame.origin.x + timer.frame.size.width + rightMargin) > cellWidth)
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
//}


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


- (void) buttonOverlaySelected
{
    CountdownViewController *countdownVC = [[CountdownViewController alloc] init];
    countdownVC.countdown = self.countdown;
    
    [self.delegateSubView pushViewController:countdownVC animated:YES];
}

@end