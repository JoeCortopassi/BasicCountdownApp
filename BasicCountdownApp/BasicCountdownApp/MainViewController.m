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
@property (nonatomic, strong) CountdownListViewController *viewCountdownList;
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
    self.viewCountdownList.delegateSubView = self;
    [self.view addSubview:self.viewCountdownList.tableView];
}


/**************************************/
# pragma mark -
# pragma mark Sub View Delegate Methods
# pragma mark -
/**************************************/
- (void) pushViewController:(UIViewController *)vc animated:(BOOL)isAnimated
{
    [self.navigationController pushViewController:vc animated:isAnimated];
}

@end