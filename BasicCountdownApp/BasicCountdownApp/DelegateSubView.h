//
//  DelegateSubView.h
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 12/6/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DelegateSubView <NSObject>
@optional
- (void) pushViewController:(UIViewController *)vc animated:(BOOL)isAnimated;
- (void) popViewController;
@end
