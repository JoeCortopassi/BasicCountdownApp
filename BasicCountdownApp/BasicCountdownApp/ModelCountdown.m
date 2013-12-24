////
//  ModelCountdown.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/6/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "ModelCountdown.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
#import "HelperDate.h"



NSString * const standardDateFormat = @"yyyy-MM-dd HH:mm:ss";



@implementation ModelCountdown

- (id) init
{
    if (self = [super init])
    {
        
    }
    
    
    return self;
}


- (void) setupTable
{
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"CREATE TABLE IF NOT EXISTS countdown (countdownId INTEGER PRIMARY KEY, dateOfEvent TEXT, imageBackgroundFileName TEXT, title TEXT)"];
    }];

}


//
//- (NSArray *) getAllCountdowns
//{
//    ObjectCountdown *countdown1 = [[ObjectCountdown alloc] init];
//    countdown1.dateOfEvent = [HelperDate getDateFromString:@"2013-12-25 00:00:00" withFormat:standardDateFormat];
//    countdown1.title = @"Christmas";
//    
//    ObjectCountdown *countdown2 = [[ObjectCountdown alloc] init];
//    countdown2.dateOfEvent = [HelperDate getDateFromString:@"2014-01-01 00:00:00" withFormat:standardDateFormat];
//    countdown2.title = @"New Years";
//    
//    ObjectCountdown *countdown3 = [[ObjectCountdown alloc] init];
//    countdown3.dateOfEvent = [HelperDate getDateFromString:@"2014-02-14 00:00:00" withFormat:standardDateFormat];
//    countdown3.title = @"Valentine's Day";
//    
//    ObjectCountdown *countdown4 = [[ObjectCountdown alloc] init];
//    countdown4.dateOfEvent = [HelperDate getDateFromString:@"2014-05-26 00:00:00" withFormat:standardDateFormat];
//    countdown4.title = @"Memorial Day";
//    
//    ObjectCountdown *countdown5 = [[ObjectCountdown alloc] init];
//    countdown5.dateOfEvent = [HelperDate getDateFromString:@"2014-07-04 00:00:00" withFormat:standardDateFormat];
//    countdown5.title = @"4th of July";
//    
//    ObjectCountdown *countdown6 = [[ObjectCountdown alloc] init];
//    countdown6.dateOfEvent = [HelperDate getDateFromString:@"2014-10-31 00:00:00" withFormat:standardDateFormat];
//    countdown6.title = @"Halloween";
//    
//    
//    return @[countdown1, countdown2, countdown3, countdown4, countdown5, countdown6];
//}

- (NSArray *) getAllCountdowns
{
    __block NSMutableArray *arrayOfCountdowns = [[NSMutableArray alloc] init];
    
    
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *results = [db executeQuery:@"SELECT * FROM countdown ORDER BY date(dateOfEvent) ASC"];
        
        while([results next])
        {
            ObjectCountdown *countdown = [[ObjectCountdown alloc] init];
            countdown.countdownId = [results intForColumn:@"countdownId"];
            countdown.title = [results stringForColumn:@"title"];
            countdown.dateOfEvent = [HelperDate getDateFromString:[results stringForColumn:@"dateOfEvent"] withFormat:standardDateFormat];
            
            [arrayOfCountdowns addObject:countdown];
        }
    }];
    
    
    return arrayOfCountdowns;
}


- (int) addNewCountdown:(ObjectCountdown *)newCountdown
{
    __block int lastId;
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"INSERT INTO countdown(dateOfEvent, imageBackgroundFileName, title) VALUES (?, ?, ?)", [HelperDate getStringFromDate:newCountdown.dateOfEvent withFormat:standardDateFormat], newCountdown.imageBackgroundFileName, newCountdown.title];
        
        lastId = [[NSNumber numberWithLongLong:[db lastInsertRowId]] intValue];
    }];
    
    
    return lastId;
}


- (void) editCountdown:(ObjectCountdown *)countdown
{
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE countdown SET dateOfEvent=?, imageBackgroundFileName=?, title=? WHERE countdownId=? LIMIT 1", countdown.dateOfEvent, countdown.imageBackgroundFileName, countdown.title, countdown.countdownId];
    }];
}


- (void) deleteCountdown:(ObjectCountdown *)countdown
{
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"DELETE FROM countdown WHERE countdownId=? LIMIT 1", countdown.countdownId];
    }];
}
@end
