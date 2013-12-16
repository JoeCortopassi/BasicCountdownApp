//
//  HelperDate.h
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/12/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelperDate : NSObject
+ (NSString *) getStringFromDate:(NSDate *)date withFormat:(NSString *)format;
+ (NSDate *) getDateFromString:(NSString *)date withFormat:(NSString *)format;
+ (NSDate *) getDateTomorrow;
@end
