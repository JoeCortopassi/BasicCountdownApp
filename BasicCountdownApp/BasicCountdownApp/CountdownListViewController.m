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
#import "ObjectCountdown.h"



@interface CountdownListViewController ()
@property (nonatomic, strong) NSArray *arrayCountdowns;
@end




@implementation CountdownListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.tableView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:(73.0f/255.0f) green:(170.0f/255.0f) blue:(238.0f/255.0f) alpha:1.0f];
        self.tableView.frame = [[UIScreen mainScreen] applicationFrame];
        
        [self loadCountdownsFromModel];
        
        [self.tableView setEditing:YES];
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
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
    ObjectCountdown *countdown1 = [[ObjectCountdown alloc] init];
    countdown1.dateOfEvent = [NSDate dateWithTimeIntervalSince1970:1387929600];
    countdown1.title = @"Christmas";
    
    ObjectCountdown *countdown2 = [[ObjectCountdown alloc] init];
    countdown2.dateOfEvent = [NSDate dateWithTimeIntervalSince1970:1388534400];
    countdown2.title = @"New Years";
    
    ObjectCountdown *countdown3 = [[ObjectCountdown alloc] init];
    countdown3.dateOfEvent = [NSDate dateWithTimeIntervalSince1970:1392336000];
    countdown3.title = @"Valentine's";
    
    ObjectCountdown *countdown4 = [[ObjectCountdown alloc] init];
    countdown4.dateOfEvent = [NSDate dateWithTimeIntervalSince1970:1401062400];
    countdown4.title = @"Memorial Day";
    
    ObjectCountdown *countdown5 = [[ObjectCountdown alloc] init];
    countdown5.dateOfEvent = [NSDate dateWithTimeIntervalSince1970:1404432000];
    countdown5.title = @"4th of July";
    
    ObjectCountdown *countdown6 = [[ObjectCountdown alloc] init];
    countdown6.dateOfEvent = [NSDate dateWithTimeIntervalSince1970:1414713600];
    countdown6.title = @"Halloween";
    
    self.arrayCountdowns = @[countdown1, countdown2, countdown3, countdown4, countdown5, countdown6];
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
        
        ObjectCountdown *countdown = [self.arrayCountdowns objectAtIndex:(indexPath.row-1)];
        [(CountdownTimerCell *)cell setCountdown:countdown];
    }
    
    
    return cell;
}


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

@end
