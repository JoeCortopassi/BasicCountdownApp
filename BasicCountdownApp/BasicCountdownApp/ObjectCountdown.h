//
//  ObjectCountdown.h
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/3/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectCountdown : NSObject
@property (nonatomic, strong) NSDate *dateOfEvent;
@property (nonatomic, strong) UIImage *imageBackground;
@property (nonatomic, strong) NSString *title;
@end
