//
//  ModelCountdown.h
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/6/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectCountdown.h"

@class FMDatabaseQueue;

@interface ModelCountdown : NSObject
@property (nonatomic, strong) FMDatabaseQueue *databaseQueue;
- (NSArray *) getAllCountdowns;
- (int) addNewCountdown:(ObjectCountdown *)newCountdown;
- (void) editCountdown:(ObjectCountdown *)countdown;
- (void) deleteCountdown:(ObjectCountdown *)countdown;
@end
