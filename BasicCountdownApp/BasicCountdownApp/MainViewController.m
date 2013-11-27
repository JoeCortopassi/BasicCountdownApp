//
//  MainViewController.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 11/21/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "MainViewController.h"
#import "CountdownListViewController.h"


@interface MainViewController ()
@property (nonatomic, strong) UITableViewController *viewCountdownList;
@end




@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        self.view.backgroundColor = [UIColor colorWithRed:(73.0f/255.0f) green:(170.0f/255.0f) blue:(238.0f/255.0f) alpha:1.0f];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViewCountdownList];
}



/**************************************/
# pragma mark -
# pragma mark Setup Methods
# pragma mark -
/**************************************/
- (void) setupViewCountdownList
{
    self.viewCountdownList = [[CountdownListViewController alloc] init];
    [self.view addSubview:self.viewCountdownList.tableView];
}



@end