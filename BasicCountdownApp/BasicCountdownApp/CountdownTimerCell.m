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
        [self setupViewBackgroundImage];
        [self setupLabelTitle];
        [self setupLabelTimer];
        
        [self updateTimer];
        
        
//        CGFloat bar = 45;
//        UILabel *foo = [[UILabel alloc] init];
//        foo.frame = CGRectMake(self.frame.size.width-bar, 0, bar, 80);
//        foo.backgroundColor = [UIColor redColor];
//        foo.text = @"";
//        [self addSubview:foo];
    }
    
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
    CGFloat inset = 5.0f;
    
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
    ObjectTimer *timer = [[ObjectTimer alloc] init];
    timer.years   = [self getRemainingTimeForTimeUnit:kYears];
    timer.months  = [self getRemainingTimeForTimeUnit:kMonths];
    timer.weeks   = [self getRemainingTimeForTimeUnit:kWeeks];
    timer.days    = [self getRemainingTimeForTimeUnit:kDays];
    timer.hours   = [self getRemainingTimeForTimeUnit:kHours];
    timer.minutes = [self getRemainingTimeForTimeUnit:kMinutes];
    timer.seconds = [self getRemainingTimeForTimeUnit:kSeconds];
    
    [self displayTimerLabelsForTimer:timer];
}


- (int) getRemainingTimeForTimeUnit:(TimeUnit)unit
{
#warning Temp hard code to make sure other parts work first
    return 4444;
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
    UILabel *labelTimer;
    UILabel *labelTimerDescription;
    UILabel *labelTimerPrevious;
    UILabel *labelTimerPreviousDescription;
    
    
    if (timeUnit == kYears)
    {
        labelTimer = self.labelTimerYears;
        labelTimer.text = [NSString stringWithFormat:@"%i", timer.years];
        labelTimerDescription = self.labelDescriptionYears;
        labelTimerPrevious = nil;
        labelTimerPreviousDescription = nil;
    }
    else if (timeUnit == kMonths)
    {
        labelTimer = self.labelTimerMonths;
        labelTimer.text = [NSString stringWithFormat:@"%i", timer.months];
        labelTimerDescription = self.labelDescriptionMonths;
        labelTimerPrevious = self.labelTimerYears;
        labelTimerPreviousDescription = self.labelDescriptionYears;
    }
    else if (timeUnit == kWeeks)
    {
        labelTimer = self.labelTimerWeeks;
        labelTimer.text = [NSString stringWithFormat:@"%i", timer.weeks];
        labelTimerDescription = self.labelDescriptionWeeks;
        labelTimerPrevious = self.labelTimerMonths;
        labelTimerPreviousDescription = self.labelDescriptionMonths;
    }
    else if (timeUnit == kDays)
    {
        labelTimer = self.labelTimerDays;
        labelTimer.text = [NSString stringWithFormat:@"%i", timer.days];
        labelTimerDescription = self.labelDescriptionDays;
        labelTimerPrevious = self.labelTimerWeeks;
        labelTimerPreviousDescription = self.labelDescriptionWeeks;
    }
    else if (timeUnit == kHours)
    {
        labelTimer = self.labelTimerHours;
        labelTimer.text = [NSString stringWithFormat:@"%i", timer.hours];
        labelTimerDescription = self.labelDescriptionHours;
        labelTimerPrevious = self.labelTimerDays;
        labelTimerPreviousDescription = self.labelDescriptionDays;
    }
    else if (timeUnit == kMinutes)
    {
        labelTimer = self.labelTimerMinutes;
        labelTimer.text = [NSString stringWithFormat:@"%i", timer.minutes];
        labelTimerDescription = self.labelDescriptionMinutes;
        labelTimerPrevious = self.labelTimerHours;
        labelTimerPreviousDescription = self.labelDescriptionHours;
    }
    else if (timeUnit == kSeconds)
    {
        labelTimer = self.labelTimerSeconds;
        labelTimer.text = [NSString stringWithFormat:@"%i", timer.seconds];
        labelTimerDescription = self.labelDescriptionSeconds;
        labelTimerPrevious = self.labelTimerMinutes;
        labelTimerPreviousDescription = self.labelDescriptionMinutes;
    }
    else
    {
        // Do nothing
    }
    
    
    if ((labelTimerPrevious.hidden == YES || labelTimerPrevious == nil) && ![labelTimer.text caseInsensitiveCompare:@"0"]==NSOrderedSame)
    {
        // First timer/description combo
        
        labelTimer.frame = CGRectMake(20, 45, 30, 30);
        labelTimer.hidden = NO;
//        labelTimer.backgroundColor = [UIColor blueColor];
        [labelTimer sizeToFit];
        
        [labelTimerDescription sizeToFit];
        labelTimerDescription.center = CGPointMake(labelTimer.center.x, labelTimer.center.y + 20);
        labelTimerDescription.hidden = NO;
    }
    else if (labelTimerPrevious.hidden == NO && labelTimerPrevious != nil)
    {
        // Each additional timer/description combo
        
        labelTimer.frame = CGRectMake(0,
                                      45,
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
            labelTimer.hidden = YES;
            labelTimerDescription.hidden = YES;
            
            return NO;
        }
    }
    else
    {
        
    }
    
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
//    else if ((description.frame.origin.x + description.frame.size.width + rightMargin) > cellWidth)
//    {
//        return YES;
//    }
    else
    {
        return NO;
    }
}
@end