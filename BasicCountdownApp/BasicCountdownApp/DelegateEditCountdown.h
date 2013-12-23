//
//  DelegateEditCountdown.h
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/23/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ObjectCountdown;


@protocol DelegateEditCountdown <NSObject>
@property (nonatomic, strong) ObjectCountdown *countdown;
@end
