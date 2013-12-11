//
//  MainViewController.h
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 11/21/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateSubView.h"


@interface MainViewController : UIViewController <DelegateSubView>
- (void) pushViewController:(UIViewController *)vc animated:(BOOL)isAnimated;
@end
