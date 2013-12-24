//
//  CountdownListHeaderCell.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 11/24/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "CountdownListHeaderCell.h"
#import "EditCountdownViewController.h"
#import "ObjectCountdown.h"
#import "HelperDate.h"



@interface CountdownListHeaderCell ()
@property (nonatomic, strong) UIButton *buttonNewCountdown;
@end




@implementation CountdownListHeaderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:(73.0f/255.0f) green:(170.0f/255.0f) blue:(238.0f/255.0f) alpha:1.0f];
        [self setupButtonNewCountdown];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void) setupButtonNewCountdown
{
    self.buttonNewCountdown = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonNewCountdown.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 70, 0, 75, 60);
    [self.buttonNewCountdown.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:45.0f]];
    [self.buttonNewCountdown.titleLabel setTextColor:[UIColor whiteColor]];
    [self.buttonNewCountdown setTitle:@"\uf196" forState:UIControlStateNormal];
    [self.buttonNewCountdown setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self.buttonNewCountdown addTarget:self action:@selector(buttonPressedNewCountdown) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.buttonNewCountdown];
}




- (void) buttonPressedNewCountdown
{
    EditCountdownViewController *editCountdownVC = [[EditCountdownViewController alloc] init];
    editCountdownVC.model = self.model;
    
    [self.delegateSubView pushViewController:editCountdownVC animated:YES];
}
@end
