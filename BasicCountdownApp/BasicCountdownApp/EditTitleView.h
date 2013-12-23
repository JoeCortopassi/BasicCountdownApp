//
//  EditTitleView.h
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/20/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateEditCountdown.h"


@class ObjectCountdown;


@interface EditTitleView : UIView <UITextFieldDelegate>
@property (nonatomic, weak) id<DelegateEditCountdown> delegateEditCountdown;
@property (nonatomic, strong) ObjectCountdown *countdown;
@property (nonatomic, strong) UIButton *buttonNext;
@end
