//
//  TimerViewBase.h
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/7/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ObjectTimer;

@interface TimerViewBase : UIView
@property (nonatomic, strong) ObjectTimer *timer;
@end
