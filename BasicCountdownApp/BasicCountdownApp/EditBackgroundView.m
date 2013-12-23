//
//  EditBackgroundView.m
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/20/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "EditBackgroundView.h"
#import "ColorPickerView.h"



@interface EditBackgroundView ()
@property (nonatomic, strong) ColorPickerView *viewColorPicker;
@property (nonatomic, strong) UIButton *buttonImage;
@end


@implementation EditBackgroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CGRect bounds = [[UIScreen mainScreen] bounds];
        self.frame = CGRectMake(0, 0, bounds.size.width - 20, 500);
        self.backgroundColor = [UIColor clearColor];
        
        [self setupViewStyle];
        [self setupLabelTitle];
        [self setupButtonPrevious];
        [self setupButtonDone];
        
        [self setupButtonsColors];
        [self setupButtonImage];
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
    label.frame = CGRectMake(20, 20, self.frame.size.width, 35);
    label.backgroundColor = [UIColor clearColor];
    label.text = @"Background";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:30];
    
    [self addSubview:label];
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


- (void) setupButtonDone
{
    self.buttonDone = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonDone.frame = CGRectMake(self.frame.size.width - 80, self.frame.size.height - 70, 70, 50);
    self.buttonDone.titleLabel.textColor = [UIColor whiteColor];
    [self.buttonDone.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:45.0f]];
    [self.buttonDone setTitle:@"Done" forState:UIControlStateNormal];
    
    
    [self addSubview:self.buttonDone];
}


- (void) setupButtonsColors
{
    self.viewColorPicker = [[ColorPickerView alloc] init];
    self.viewColorPicker.frame = CGRectMake(0, 55, self.frame.size.width, 300);

    [self addSubview:self.viewColorPicker];
}


- (void) setupButtonImage
{
    self.buttonImage = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonImage.frame = CGRectMake(20, self.viewColorPicker.frame.origin.y + self.viewColorPicker.frame.size.height, self.frame.size.width - 40, 50);
    self.buttonImage.clipsToBounds = YES;
    self.buttonImage.backgroundColor = [UIColor whiteColor];
    [self.buttonImage setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.buttonImage.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [self.buttonImage setTitle:@"Use Image Instead" forState:UIControlStateNormal];
    [self.buttonImage addTarget:self action:@selector(nilSymbol) forControlEvents:UIControlEventTouchUpInside];
    self.buttonImage.layer.cornerRadius = 10;
    self.buttonImage.layer.borderWidth = 1;
    self.buttonImage.layer.borderColor = [UIColor darkGrayColor].CGColor;
    
    [self addSubview:self.buttonImage];
}





/**************************************/
# pragma mark -
# pragma mark Button Actions
# pragma mark -
/**************************************/
- (void) buttonPressedColor:(id)sender
{
    
}

@end
