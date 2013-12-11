//
//  CountdownListViewController.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 11/24/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "CountdownListViewController.h"
#import "CountdownListHeaderCell.h"
#import "CountdownTimerCell.h"
#import "CountdownViewController.h"
#import "Model.h"
#import "ObjectCountdown.h"



@interface CountdownListViewController ()
@property (nonatomic, strong) NSArray *arrayCountdowns;
@property (nonatomic, strong) Model *model;
@end




@implementation CountdownListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.tableView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:(73.0f/255.0f) green:(170.0f/255.0f) blue:(238.0f/255.0f) alpha:1.0f];
        self.tableView.frame = [[UIScreen mainScreen] applicationFrame];
        
        self.model = [[Model alloc] init];
        [self loadCountdownsFromModel];
        
        [self.tableView setEditing:YES];
//        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
            CGFloat topBarOffset = 22;
            self.tableView.frame = CGRectMake(0,
                                              topBarOffset,
                                              self.tableView.frame.size.width,
                                              self.tableView.frame.size.height);
        }
        
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0)
    {
        self.tableView.backgroundColor = [UIColor colorWithRed:(73.0f/255.0f) green:(170.0f/255.0f) blue:(238.0f/255.0f) alpha:1.0f];
    }
    else
    {
        self.tableView.backgroundColor = [UIColor whiteColor];
    }
}


- (void) loadCountdownsFromModel
{
    self.arrayCountdowns = [self.model.countdown getAllCountdowns];
}



/**************************************/
# pragma mark -
# pragma mark Table view data source
# pragma mark -
/**************************************/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.arrayCountdowns count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    
    if (indexPath.row == 0)
    {
        static NSString *HeaderIdentifier = @"Header";
        cell = [tableView dequeueReusableCellWithIdentifier:HeaderIdentifier];
        // Configure the cell...
        
        if (cell == nil)
        {
            cell = [[CountdownListHeaderCell alloc] init];
        }
        
    }
    else
    {
        static NSString *CellIdentifier = @"Cell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        // Configure the cell...
        
        if (cell == nil)
        {
            cell = [[CountdownTimerCell alloc] init];
        }
        
        [(CountdownTimerCell  *)cell setDelegateSubView:self];
        
        ObjectCountdown *countdown = [self.arrayCountdowns objectAtIndex:(indexPath.row-1)];
        [(CountdownTimerCell *)cell setCountdown:countdown];
    }
    
    
    return cell;
}



/**************************************/
# pragma mark -
# pragma mark Table View Delegate Methods
# pragma mark -
/**************************************/

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    if (indexPath.row == 0)
    {
        return NO;
    }
    
    return YES;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    if (indexPath.row == 0)
    {
        return NO;
    }
    
    
    return YES;
}


- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (proposedDestinationIndexPath.row == 0)
    {
        return [NSIndexPath indexPathForRow:1 inSection:0];
    }
    
    return proposedDestinationIndexPath;
}



- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableview shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 70;
    }
    else
    {
        return 100;
    }
}



/**************************************/
# pragma mark -
# pragma mark Sub View Delegate Methods
# pragma mark -
/**************************************/
- (void) pushViewController:(UIViewController *)vc animated:(BOOL)isAnimated
{
    [self.delegateSubView pushViewController:vc animated:isAnimated];
}


- (void) popViewController
{
    [self.delegateSubView popViewController];
}

@end
