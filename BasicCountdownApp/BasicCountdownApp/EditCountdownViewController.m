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
#import <QuartzCore/QuartzCore.h>



@interface EditCountdownViewController ()
@property (nonatomic, strong) UIImageView *viewBackgroundImage;
@property (nonatomic, strong) LabelTitle *labelTitle;
@property (nonatomic, strong) UILabel *labelCountdownDate;
@property (nonatomic, strong) TimerViewHorizontal *viewTimer;
@property (nonatomic, strong) UIButton *buttonExit;
@property (nonatomic, strong) UIButton *buttonEdit;
@property (nonatomic, strong) UIButton *buttonSave;
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
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupViewBackgroundImage];
    [self setupLabelCountdownDate];
    [self setupLabelTitle];
    [self setupViewTimer];
    
    [self setupButtonExit];
    [self setupButtonEdit];
    [self setupButtonSave];
}





/**************************************/
# pragma mark -
# pragma mark Setup Methods
# pragma mark -
/**************************************/

- (void) setupButtonExit
{
    self.buttonExit = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonExit.frame = CGRectMake(0, 22, 70, 70);
//    self.buttonExit.backgroundColor = [UIColor orangeColor];
    self.buttonExit.titleLabel.textColor = [UIColor blackColor];
    [self.buttonExit.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:45.0f]];
    [self.buttonExit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.buttonExit setTitle:@"\uf05c" forState:UIControlStateNormal];
    [self.buttonExit addTarget:self action:@selector(buttonPressedExit) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.buttonExit];
}


- (void) setupButtonEdit
{
    self.buttonEdit = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonEdit.frame = CGRectMake(100, 22, 70, 70);
    self.buttonEdit.center = CGPointMake(self.view.frame.size.width/2, (self.buttonEdit.frame.size.height/2) + self.buttonEdit.frame.origin.y);
//    self.buttonEdit.backgroundColor = [UIColor orangeColor];
    [self.buttonEdit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.buttonEdit.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:45.0f]];
    self.buttonEdit.titleLabel.textColor = [UIColor blackColor];
    [self.buttonEdit setTitle:@"\uf044" forState:UIControlStateNormal];
    [self.buttonEdit addTarget:self action:@selector(buttonPressedEdit) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.buttonEdit];
}


- (void) setupButtonSave
{
    self.buttonSave = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonSave.frame = CGRectMake(self.view.frame.size.width-70, 22, 70, 70);
    //    self.buttonSave.backgroundColor = [UIColor orangeColor];
    [self.buttonSave setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.buttonSave.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:45.0f]];
    self.buttonSave.titleLabel.textColor = [UIColor blackColor];
    [self.buttonSave setTitle:@"\uf0c7" forState:UIControlStateNormal];
    [self.buttonSave addTarget:self action:@selector(buttonPressedSave) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.buttonSave];
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





/**************************************/
# pragma mark -
# pragma mark Button Actions
# pragma mark -
/**************************************/

- (void) buttonPressedExit
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void) buttonPressedEdit
{
    
}


- (void) buttonPressedSave
{
    
}

@end
