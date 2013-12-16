//
//  Model.m
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/6/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "Model.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"



@interface Model ()
@property (nonatomic, strong) FMDatabaseQueue *databaseQueue;
@end




@implementation Model
- (id) init
{
    if ((self = [super init]))
    {
        [self setupDatabase];
        self.countdown = [[ModelCountdown alloc] init];
        self.countdown.databaseQueue = self.databaseQueue;
    }
    
    
    return self;
}

- (void) setupDatabase
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"database.sqlite"];
    
    self.databaseQueue = [FMDatabaseQueue databaseQueueWithPath:path];
}
@end
