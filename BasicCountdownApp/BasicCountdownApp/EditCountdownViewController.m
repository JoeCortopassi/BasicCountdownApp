//
//  EditCountdownViewController.m
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/14/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "EditCountdownViewController.h"
#import "LabelTitle.h"
#import "Model.h"
#import "ObjectCountdown.h"
#import "TimerViewHorizontal.h"
#import "HelperTimer.h"
#import "HelperDate.h"
#import "FadeOutOverlayView.h"
#import "EditPagingView.h"
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
// Edit views
@property (nonatomic, strong) FadeOutOverlayView *viewFadeOutOverlay;
@property (nonatomic, strong) EditPagingView *viewEditPaging;
@end





@implementation EditCountdownViewController

- (id)init
{
    if (self = [super init])
    {
        // Custom initialization
        [self setupCountdown];
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
    
    [self setupViewFadeOutOverlay];
    [self setupViewEditPaging];
    [self setupButtonCloseEdit];
}





/**************************************/
# pragma mark -
# pragma mark Setup Methods
# pragma mark -
/**************************************/
- (void) setupCountdown
{
    ObjectCountdown *countdown = [[ObjectCountdown alloc] init];
    countdown.title = @"New Countdown";
    countdown.dateOfEvent = [HelperDate getDateTomorrow];
    
    self.countdown = countdown;
}


- (void) setupViewFadeOutOverlay
{
    self.viewFadeOutOverlay = [[FadeOutOverlayView alloc] init];
    self.viewFadeOutOverlay.hidden = YES;
    self.viewFadeOutOverlay.alpha = 0.0;
    
    [self.view addSubview:self.viewFadeOutOverlay];
}


- (void) setupButtonCloseEdit
{
    [self.viewEditPaging.buttonEditClose addTarget:self action:@selector(buttonPressedEditClose) forControlEvents:UIControlEventTouchUpInside];
}


- (void) setupViewEditPaging
{
    self.viewEditPaging = [[EditPagingView alloc] init];
    self.viewEditPaging.delegateEditCountdown = self;
    self.viewEditPaging.hidden = YES;
    self.viewEditPaging.alpha = 0.0;
    self.viewEditPaging.countdown = self.countdown;
    
    
    [self.view addSubview:self.viewEditPaging];
}


- (void) setupButtonExit
{
    self.buttonExit = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonExit.frame = CGRectMake(0, 22, 70, 70);
//    self.buttonExit.backgroundColor = [UIColor orangeColor];
    self.buttonExit.titleLabel.textColor = [UIColor blackColor];
    [self.buttonExit.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:35.0f]];
    [self.buttonExit setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.buttonExit setTitle:@"\uf05c" forState:UIControlStateNormal];
    [self.buttonExit addTarget:self action:@selector(buttonPressedExit) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.buttonExit];
}


- (void) setupButtonEdit
{
    self.buttonEdit = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonEdit.frame = CGRectMake(self.view.frame.size.width-120, 22, 60, 70);
//    self.buttonEdit.backgroundColor = [UIColor orangeColor];
    [self.buttonEdit setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.buttonEdit.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:35.0f]];
    self.buttonEdit.titleLabel.textColor = [UIColor blackColor];
    [self.buttonEdit setTitle:@"\uf044" forState:UIControlStateNormal];
    [self.buttonEdit addTarget:self action:@selector(buttonPressedEdit) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.buttonEdit];
}


- (void) setupButtonSave
{
    self.buttonSave = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.buttonSave.frame = CGRectMake(self.view.frame.size.width-70, self.view.frame.size.height - 70, 70, 70);
    self.buttonSave.frame = CGRectMake(self.view.frame.size.width-60, 22, 60, 70);
    //    self.buttonSave.backgroundColor = [UIColor orangeColor];
    [self.buttonSave setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.buttonSave.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:35.0f]];
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
# pragma mark Setters
# pragma mark -
/**************************************/
- (void) setCountdown:(ObjectCountdown *)newCountdown
{
    _countdown = newCountdown;
    self.viewEditPaging.countdown = newCountdown;
    self.labelTitle.text = newCountdown.title;
    self.labelCountdownDate.text = [HelperTimer stringFromDate:newCountdown.dateOfEvent];
    self.viewTimer.date = newCountdown.dateOfEvent;
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
    [UIView animateWithDuration:0.3 animations:^(void){
        self.viewFadeOutOverlay.hidden = NO;
        self.viewFadeOutOverlay.alpha = self.viewFadeOutOverlay.opacity;
        
        self.viewEditPaging.buttonEditClose.hidden = NO;
        
        self.viewEditPaging.hidden = NO;
        self.viewEditPaging.alpha = 1.0;
        
    }];
}


- (void) buttonPressedSave
{
    [self.model.countdown addNewCountdown:self.countdown];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Countdown Saved"
                                                    message:@"Your new countdown has been saved!"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void) buttonPressedEditClose
{
    [UIView animateWithDuration:0.3 animations:^(void){
        self.viewFadeOutOverlay.alpha = 0.0;
        self.viewEditPaging.alpha = 0.0;
    } completion:^(BOOL finished){
        self.viewFadeOutOverlay.hidden = YES;
        self.viewEditPaging.buttonEditClose.hidden = YES;
        self.viewEditPaging.hidden = YES;
        self.viewEditPaging.contentOffset = CGPointMake(0, 0);
    }];
}




/**************************************/
# pragma mark -
# pragma mark Edit Views
# pragma mark -
/**************************************/

@end
