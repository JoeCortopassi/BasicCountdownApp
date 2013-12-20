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
#import "TimerViewHorizontal.h"



@interface CountdownViewController ()
@property (nonatomic, strong) UIImageView *viewBackgroundImage;
@property (nonatomic, strong) UIButton *buttonExit;
@property (nonatomic, strong) LabelTitle *labelTitle;
@property (nonatomic, strong) UILabel *labelCountdownDate;
@property (nonatomic, strong) TimerViewHorizontal *viewTimer;
@property (nonatomic, strong) NSTimer *timerRefresh;
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
    
    [self setupViewBackgroundImage];
    [self setupButtonExit];
    [self setupLabelCountdownDate];
    [self setupLabelTitle];
    [self setupViewTimer];
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
- (void) setupViewBackgroundImage
{
    
}


- (void) setupButtonExit
{
    CGFloat buttonSize = 50;
    CGFloat margin = 5;
    UIColor *colorExit = [UIColor colorWithRed:(0.0f/255.0f) green:(0.0f/255.0f) blue:(0.0f/255.0f) alpha:0.5f];
    
    self.buttonExit = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonExit.frame = CGRectMake(self.view.frame.size.width - buttonSize - margin, 22 + margin, buttonSize, buttonSize);
    self.buttonExit.backgroundColor = [UIColor clearColor];
    [self.buttonExit setTitle:@"X" forState:UIControlStateNormal];
    self.buttonExit.titleLabel.font = [UIFont systemFontOfSize:24];
    [self.buttonExit.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.buttonExit.titleLabel.textColor = colorExit;
    [self.buttonExit addTarget:self action:@selector(buttonPressedExit) forControlEvents:UIControlEventTouchUpInside];

    self.buttonExit.layer.cornerRadius = buttonSize/2;
    self.buttonExit.layer.borderWidth = 1;
    self.buttonExit.layer.borderColor = colorExit.CGColor;
    
    [self.view addSubview:self.buttonExit];
}


- (void) setupLabelCountdownDate
{
    self.labelCountdownDate = [[UILabel alloc] init];
    self.labelCountdownDate.frame = CGRectMake(0, self.labelTitle.frame.origin.y + self.labelTitle.frame.size.height, self.view.frame.size.width, 40);
    self.labelCountdownDate.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    self.labelCountdownDate.backgroundColor = [UIColor clearColor];
    self.labelCountdownDate.textAlignment = NSTextAlignmentCenter;
    self.labelCountdownDate.textColor = [UIColor lightGrayColor];
    self.labelCountdownDate.text = [HelperTimer stringFromDate:self.countdown.dateOfEvent];

//    self.labelCountdownDate.backgroundColor = [UIColor blueColor];
  
    [self.view addSubview:self.labelCountdownDate];
}


- (void)setupLabelTitle
{
    CGFloat height = 50;
    CGFloat margin = 0;
    
    self.labelTitle = [[LabelTitle alloc] init];
    self.labelTitle.text = self.countdown.title;
    [self.labelTitle sizeToFit];
    self.labelTitle.frame = CGRectMake(0,
                                       self.labelCountdownDate.frame.origin.y - margin - height,
                                       self.view.frame.size.width,
                                       height);
    self.labelTitle.textAlignment = NSTextAlignmentCenter;
    
//    self.labelTitle.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.labelTitle];
}


- (void) setupViewTimer
{
    CGFloat bottomOfLastLabel = self.labelCountdownDate.frame.origin.y + self.labelCountdownDate.frame.size.height;
    CGRect rect = CGRectMake(50,
                             bottomOfLastLabel,//(self.view.frame.size.height/2)-25,
                             self.view.frame.size.width,
                             60);
    self.viewTimer = [[TimerViewHorizontal alloc] initWithFrame:rect];
    self.viewTimer.date = self.countdown.dateOfEvent;
    self.viewTimer.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.viewTimer];
}





/**************************************/
# pragma mark -
# pragma mark Button Actions
# pragma mark -
/**************************************/
- (void) buttonPressedExit
{
    [self.delegateSubView popViewController];
}

@end
