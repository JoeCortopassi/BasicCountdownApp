//
//  ObjectTimer.h
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/3/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectTimer : NSObject
@property (nonatomic, assign) int years;
@property (nonatomic, assign) int months;
@property (nonatomic, assign) int weeks;
@property (nonatomic, assign) int days;
@property (nonatomic, assign) int hours;
@property (nonatomic, assign) int minutes;
@property (nonatomic, assign) int seconds;
@end
