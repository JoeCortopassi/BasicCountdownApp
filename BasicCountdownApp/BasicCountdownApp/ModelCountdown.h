//
//  ModelCountdown.h
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/6/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectCountdown.h"

@interface ModelCountdown : NSObject
- (NSArray *) getAllCountdowns;
- (void) addNewCountdown:(ObjectCountdown *)newCountdown;
- (void) editCountdown:(ObjectCountdown *)countdown;
- (void) deleteCountdown:(ObjectCountdown *)countdown;
@end
