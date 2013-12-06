//
//  CountdownListViewController.h
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 11/24/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateSubView.h"

@interface CountdownListViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, DelegateSubView>
@property (nonatomic, weak) id<DelegateSubView> delegateSubView;
- (void) pushViewController:(UIViewController *)vc animated:(BOOL)isAnimated;
@end
