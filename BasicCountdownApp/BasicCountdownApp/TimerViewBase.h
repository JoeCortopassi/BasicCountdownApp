//
//  TimerViewBase.h
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/7/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    kVertical,
    kHorizontal
} TimerOrientation;


@class ObjectTimer;

@interface TimerViewBase : UIView
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, assign) CGFloat outerWidthOfTimers;
@end
