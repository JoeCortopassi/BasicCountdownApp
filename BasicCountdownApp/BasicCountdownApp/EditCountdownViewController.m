//
//  EditCountdownViewController.m
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/14/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "EditCountdownViewController.h"
#import "LabelTitle.h"
#import "ObjectCountdown.h"
#import "TimerViewHorizontal.h"
#import "HelperTimer.h"



@interface EditCountdownViewController ()
@property (nonatomic, strong) UIImageView *viewBackgroundImage;
@property (nonatomic, strong) UIButton *buttonExit;
@property (nonatomic, strong) LabelTitle *labelTitle;
@property (nonatomic, strong) UILabel *labelCountdownDate;
@property (nonatomic, strong) TimerViewHorizontal *viewTimer;
@property (nonatomic, strong) NSTimer *timerRefresh;
@end





@implementation EditCountdownViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self setupViewBackgroundImage];
    [self setupLabelCountdownDate];
    [self setupLabelTitle];
    [self setupViewTimer];
}





- (void) setupViewBackgroundImage
{
    
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

@end
