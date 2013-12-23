//
//  EditTitleView.m
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/20/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "EditTitleView.h"
#import "ObjectCountdown.h"


@interface EditTitleView ()
@property (nonatomic, strong) UITextField *inputTitle;
@end




@implementation EditTitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CGRect bounds = [[UIScreen mainScreen] bounds];
        self.frame = CGRectMake(0, 0, bounds.size.width - 20, 170);
        self.backgroundColor = [UIColor clearColor];
        
        [self setupViewStyle];
        [self setupLabelTitle];
        [self setupInputTitle];
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
    label.frame = CGRectMake(23, 20, self.frame.size.width, 30);
    label.backgroundColor = [UIColor clearColor];
    label.text = @"Title";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:30];
    
    [self addSubview:label];
}


- (void) setupInputTitle
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(20, 60, self.frame.size.width - 40, 50);
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"";
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    
    [self addSubview:label];
    
    
    CGFloat padding = 3;
    
    self.inputTitle = [[UITextField alloc] init];
    self.inputTitle.frame = CGRectMake(label.frame.origin.x + padding,
                                       label.frame.origin.y + padding,
                                       label.frame.size.width - (padding*2),
                                       label.frame.size.height - (padding*2));
    self.inputTitle.delegate = self;
    self.inputTitle.borderStyle = UITextBorderStyleNone;
    self.inputTitle.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:45.0f];
    self.inputTitle.adjustsFontSizeToFitWidth = YES;
    
    [self addSubview:self.inputTitle];
}


- (void) setupButtonNext
{
    self.buttonNext = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonNext.frame = CGRectMake(self.frame.size.width - 80, 110, 70, 50);
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
    self.inputTitle.text = newCountdown.title;
}




/**************************************/
# pragma mark -
# pragma mark UITextField Delegate
# pragma mark -
/**************************************/

- (void) textFieldDidEndEditing:(UITextField *)textField
{
    self.countdown.title = textField.text;
    self.delegateEditCountdown.countdown = self.countdown;
}

@end
