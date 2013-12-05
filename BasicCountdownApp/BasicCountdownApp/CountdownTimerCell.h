//
//  CountdownTimerCell.h
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 11/24/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectCountdown.h"

@interface CountdownTimerCell : UITableViewCell
@property (nonatomic, strong) ObjectCountdown *countdown;
- (void) updateTimer;
@end
