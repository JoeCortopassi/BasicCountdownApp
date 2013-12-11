//
//  Model.h
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/6/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelCountdown.h"
@interface Model : NSObject
@property (nonatomic, strong) ModelCountdown *countdown;
- (id) init;
@end
