//
//  EditBackgroundView.h
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/20/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateEditCountdown.h"


@class ObjectCountdown;


@interface EditBackgroundView : UIView
@property (nonatomic, weak) id<DelegateEditCountdown> delegateEditCountdown;
@property (nonatomic, strong) ObjectCountdown *countdown;
@property (nonatomic, strong) UIButton *buttonPrevious;
@property (nonatomic, strong) UIButton *buttonDone;
@end
