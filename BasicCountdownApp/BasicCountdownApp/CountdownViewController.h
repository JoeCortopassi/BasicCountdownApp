//
//  CountdownViewController.h
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/1/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateSubView.h"


@class ObjectCountdown;


@interface CountdownViewController : UIViewController
@property (nonatomic, weak) id<DelegateSubView> delegateSubView;
@property (nonatomic, strong) ObjectCountdown *countdown;
@end
