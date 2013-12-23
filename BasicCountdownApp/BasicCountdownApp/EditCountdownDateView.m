//
//  EditCountdownDateView.m
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/20/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "EditCountdownDateView.h"
#import "ObjectCountdown.h"



@interface EditCountdownDateView ()
@property (nonatomic, strong) UIDatePicker *datePicker;
@end




@implementation EditCountdownDateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CGRect bounds = [[UIScreen mainScreen] bounds];
        self.frame = CGRectMake(0, 0, bounds.size.width - 20, 350);
        self.backgroundColor = [UIColor clearColor];
        
        [self setupViewStyle];
        [self setupLabelTitle];
        [self setupDatePicker];
        [self setupButtonPrevious];
        [self setupButtonNext];
    }
    return self;
}


- (void) setupViewStyle
{
    UIView *background = [[UIView alloc] init];
    background.frame = self.frame;
    background.backgroundColor = [UIColor colorWithRed:(73.0f/255.0f) green:(170.0f/255.0f) blue:(238.0f/255.0f) alpha:1.0f];
    background.layer.cornerRadius = 5;
    background.clipsToBounds = YES;
    [self addSubview:background];
    
    [self.layer setShadowOffset:CGSizeMake(1, 2)];
    [self.layer setShadowRadius:5.0];
    [self.layer setShadowOpacity:0.5];
}


- (void) setupLabelTitle
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(20, 20, self.frame.size.width, 30);
    label.backgroundColor = [UIColor clearColor];
    label.text = @"Countdown Date";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:30];
    
    [self addSubview:label];
}


- (void) setupDatePicker
{
    self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.frame = CGRectMake(25, 60, self.frame.size.width-50, 0);
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(self.datePicker.frame.origin.x - 5,
                             self.datePicker.frame.origin.y + 10,
                             self.datePicker.frame.size.width + 10,
                             self.datePicker.frame.size.height - 20);
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"";
//    label.layer.borderColor = [UIColor darkGrayColor].CGColor;
//    label.layer.borderWidth = 2;
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    
    
    [self addSubview:label];
    [self addSubview:self.datePicker];
}


- (void) setupButtonPrevious
{
    self.buttonPrevious = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonPrevious.frame = CGRectMake(15, self.frame.size.height - 70, 70, 50);
    self.buttonPrevious.titleLabel.textColor = [UIColor whiteColor];
    [self.buttonPrevious.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:45.0f]];
    [self.buttonPrevious setTitle:@"\uf177" forState:UIControlStateNormal];
    
    
    [self addSubview:self.buttonPrevious];
}


- (void) setupButtonNext
{
    self.buttonNext = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonNext.frame = CGRectMake(self.frame.size.width - 80, self.frame.size.height - 70, 70, 50);
    self.buttonNext.titleLabel.textColor = [UIColor whiteColor];
    [self.buttonNext.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:45.0f]];
    [self.buttonNext setTitle:@"\uf178" forState:UIControlStateNormal];
    
    
    [self addSubview:self.buttonNext];
}




/**************************************/
# pragma mark -
# pragma mark Setters
# pragma mark -
/**************************************/
- (void) setCountdown:(ObjectCountdown *)newCountdown
{
    _countdown = newCountdown;
    (newCountdown)? [self.datePicker setDate:newCountdown.dateOfEvent]: nil;
}




/**************************************/
# pragma mark -
# pragma mark Actions
# pragma mark -
/**************************************/

- (void) dateChanged:(UIDatePicker *)sender
{
    self.countdown.dateOfEvent = [sender date];
    self.delegateEditCountdown.countdown = self.countdown;
}


@end
