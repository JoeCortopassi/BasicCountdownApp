//
//  EditPagingView.m
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/20/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "EditPagingView.h"
#import "EditTitleView.h"
#import "EditCountdownDateView.h"
#import "EditBackgroundView.h"



@interface EditPagingView ()
@property (nonatomic, strong) EditTitleView *viewEditTitle;
@property (nonatomic, strong) EditCountdownDateView *viewEditCountdownDate;
@property (nonatomic, strong) EditBackgroundView *viewEditBackground;
@end






@implementation EditPagingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = [[UIScreen mainScreen] bounds];
        self.contentSize = CGSizeMake(self.frame.size.width*3, self.frame.size.height);
        self.backgroundColor = [UIColor clearColor];
        self.scrollEnabled = NO;
        self.pagingEnabled = YES;
        
        [self setupButtonCloseEdit];
        [self setupViewEditTitle];
        [self setupViewEditCountdownDate];
        [self setupViewEditBackground];
    }
    return self;
}


- (void) setupButtonCloseEdit
{
    self.buttonEditClose = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonEditClose.frame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
    self.buttonEditClose.backgroundColor = [UIColor clearColor];
    [self.buttonEditClose setTitle:@"" forState:UIControlStateNormal];
    [self.buttonEditClose addTarget:self action:@selector(buttonPressedCloseEdit) forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonEditClose.hidden = YES;
    
    [self addSubview:self.buttonEditClose];
}


- (void) setupViewEditTitle
{
    self.viewEditTitle = [[EditTitleView alloc] init];
    self.viewEditTitle.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [self.viewEditTitle.buttonNext addTarget:self action:@selector(pageTitleToDate) forControlEvents:UIControlEventTouchUpInside];
    [self.viewEditTitle.buttonNext addTarget:self action:@selector(buttonPressedCloseEdit) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.viewEditTitle];
}


- (void) setupViewEditCountdownDate
{
    self.viewEditCountdownDate = [[EditCountdownDateView alloc] init];
    self.viewEditCountdownDate.center = CGPointMake(self.frame.size.width + (self.frame.size.width/2), self.frame.size.height/2);
    [self.viewEditCountdownDate.buttonPrevious addTarget:self action:@selector(pageDateToTitle) forControlEvents:UIControlEventTouchUpInside];
    [self.viewEditCountdownDate.buttonNext addTarget:self action:@selector(pageDateToBackground) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.viewEditCountdownDate];
}


- (void) setupViewEditBackground
{
    self.viewEditBackground = [[EditBackgroundView alloc] init];
    self.viewEditBackground.center = CGPointMake((self.frame.size.width*2) + (self.frame.size.width/2), self.frame.size.height/2);
    [self.viewEditBackground.buttonPrevious addTarget:self action:@selector(pageBackgroundToDate) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.viewEditBackground];
}



- (void) buttonPressedCloseEdit
{
    [self endEditing:YES];
}




/**************************************/
# pragma mark -
# pragma mark SubView Paging Actions
# pragma mark -
/**************************************/
- (void) pageTitleToDate
{
    [UIView animateWithDuration:0.5 animations:^(void){
        self.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
    }];
}


- (void) pageDateToTitle
{
    [UIView animateWithDuration:0.5 animations:^(void){
        self.contentOffset = CGPointMake(0, 0);
    }];
}


- (void) pageDateToBackground
{
    [UIView animateWithDuration:0.5 animations:^(void){
        self.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width * 2, 0);
    }];
}


- (void) pageBackgroundToDate
{
    [UIView animateWithDuration:0.5 animations:^(void){
        self.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
    }];
}


@end
