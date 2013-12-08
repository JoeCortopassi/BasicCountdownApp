//
//  CountdownViewController.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/1/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "CountdownViewController.h"
#import "LabelTitle.h"
#import "LabelTimer.h"
#import "LabelDescription.h"
#import "ObjectCountdown.h"
#import "ObjectTimer.h"
#import "HelperTimer.h"


@interface CountdownViewController ()
@property (nonatomic, strong) UIButton *buttonExit;
@property (nonatomic, strong) LabelTitle *labelTitle;
@property (nonatomic, strong) UILabel *labelCountdownDate;
@property (nonatomic, strong) NSTimer *timerRefresh;
@property (nonatomic, strong) UIImageView *viewBackgroundImage;
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




@implementation CountdownViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        // Custom initialization
        
    }
    
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupButtonExit];
    [self setupLabelTitle];
    [self setupLabelCountdownDate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/**************************************/
# pragma mark -
# pragma mark Setup Methods
# pragma mark -
/**************************************/
- (void) setupButtonExit
{
    CGFloat buttonSize = 70;
    
    self.buttonExit = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonExit.frame = CGRectMake(self.view.frame.size.width - buttonSize, 22, buttonSize, buttonSize);
    self.buttonExit.backgroundColor = [UIColor clearColor];
    [self.buttonExit setTitle:@"X" forState:UIControlStateNormal];
    self.buttonExit.titleLabel.font = [UIFont systemFontOfSize:48];
    [self.buttonExit.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.buttonExit.titleLabel.textColor = [UIColor colorWithRed:(0.0f/255.0f) green:(0.0f/255.0f) blue:(0.0f/255.0f) alpha:0.8f];
    [self.buttonExit addTarget:self action:@selector(buttonExitPressed) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.buttonExit];
}


- (void)setupLabelTitle
{
    self.labelTitle = [[LabelTitle alloc] init];
    self.labelTitle.frame =CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 50);
    self.labelTitle.textAlignment = NSTextAlignmentCenter;
    self.labelTitle.text = self.countdown.title;
    
    [self.view addSubview:self.labelTitle];
}


- (void) setupLabelCountdownDate
{
    self.labelCountdownDate = [[UILabel alloc] init];
    self.labelCountdownDate.frame = CGRectMake(0, self.labelTitle.frame.origin.y + self.labelTitle.frame.size.height, self.view.frame.size.width, 50);
    self.labelCountdownDate.backgroundColor = [UIColor clearColor];
    self.labelCountdownDate.textAlignment = NSTextAlignmentCenter;
    self.labelCountdownDate.textColor = [UIColor lightGrayColor];
    self.labelCountdownDate.text = [HelperTimer stringFromDate:self.countdown.dateOfEvent];
    
    [self.view addSubview:self.labelCountdownDate];
}




/**************************************/
# pragma mark -
# pragma mark Button Actions
# pragma mark -
/**************************************/
- (void) buttonExitPressed
{
    [self.delegateSubView popViewController];
}

@end
