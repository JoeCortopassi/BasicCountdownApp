//
//  CountdownViewController.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/1/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "CountdownViewController.h"

@interface CountdownViewController ()

@end

@implementation CountdownViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        // Custom initialization
        self.view.backgroundColor = [UIColor blueColor];
    }
    
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
- (void)setupLabelTitle
{
    
}

@end
