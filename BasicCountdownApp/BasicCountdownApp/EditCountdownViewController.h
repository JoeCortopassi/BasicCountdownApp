//
//  EditCountdownViewController.h
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/14/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateEditCountdown.h"

@class ObjectCountdown;

@interface EditCountdownViewController : UIViewController <DelegateEditCountdown>
@property (nonatomic, strong) ObjectCountdown *countdown;
@end
