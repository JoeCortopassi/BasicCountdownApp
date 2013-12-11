//
//  CountdownTimerCell.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 11/24/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "CountdownTimerCell.h"
#import "CountdownViewController.h"
#import "TimerViewHorizontal.h"
#import "LabelTitle.h"
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
@property (nonatomic, strong) TimerViewHorizontal *viewTimerHorizontal;
@property (nonatomic, strong) LabelTitle *labelTitle;
@property (nonatomic, strong) UIButton *buttonOverlay;
@end




@implementation CountdownTimerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self)
    {
        // Initialization code
        //self.backgroundColor = [UIColor whiteColor];
        self.showsReorderControl = YES;
    }
    
    
    return self;
}


- (void) layoutSubviews
{
    [super layoutSubviews];
    
    [self setupViewBackgroundImage];

    self.labelTitle = [[LabelTitle alloc] init];
    self.labelTitle.text = self.countdown.title;
    [self addSubview:self.labelTitle];

    [self setupLabelTimer];
    [self setupButtonOverlay];
}


- (void)setAlpha:(CGFloat)alpha
{
    [super setAlpha:1.0f];
}


- (void) setCountdown:(ObjectCountdown *)newCountdown
{
    self.labelTitle.text = newCountdown.title;
    _countdown = newCountdown;
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



- (void) setupLabelTimer
{
    CGRect rect = CGRectMake(0, 50, self.frame.size.width, 50);
    self.viewTimerHorizontal = [[TimerViewHorizontal alloc] initWithFrame:rect];
    //self.viewTimerHorizontal.timer = [HelperTimer getCountdownTimerForDate:self.countdown.dateOfEvent];
    self.viewTimerHorizontal.date = self.countdown.dateOfEvent;
    
    [self addSubview:self.viewTimerHorizontal];
}


- (void) setupButtonOverlay
{
    self.buttonOverlay = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonOverlay.frame = CGRectMake(0, 0, self.frame.size.width-60, self.frame.size.height);
    self.buttonOverlay.backgroundColor = [UIColor clearColor];
    [self.buttonOverlay setTitle:@"" forState:UIControlStateNormal];
    [self.buttonOverlay addTarget:self action:@selector(buttonOverlaySelected) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.buttonOverlay];
}



- (void) buttonOverlaySelected
{
    CountdownViewController *countdownVC = [[CountdownViewController alloc] init];
    countdownVC.delegateSubView = self;
    countdownVC.countdown = self.countdown;
    
    [self.delegateSubView pushViewController:countdownVC animated:YES];
}



/**************************************/
# pragma mark -
# pragma mark Sub View Delegate Methods
# pragma mark -
/**************************************/

- (void) pushViewController:(UIViewController *)vc animated:(BOOL)isAnimated
{
    [self.delegateSubView pushViewController:vc animated:isAnimated];
}


- (void) popViewController
{
    [self.delegateSubView popViewController];
}

@end