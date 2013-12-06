//
//  HelperTimer.h
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/6/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ObjectTimer, LabelTimer, LabelDescription;

@interface HelperTimer : NSObject
+ (ObjectTimer *) getCountdownTimerForDate:(NSDate *)date;
+ (BOOL) doesTimer:(LabelTimer *)timer orDescription:(LabelDescription *)description overflowForFrame:(CGRect)frame withMargin:(CGFloat)margin;

@end
