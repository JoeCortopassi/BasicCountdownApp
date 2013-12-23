//
//  EditPagingView.h
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/20/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateEditCountdown.h"


@class ObjectCountdown;


@interface EditPagingView : UIScrollView
@property (nonatomic, weak) id<DelegateEditCountdown> delegateEditCountdown;
@property (nonatomic, strong) UIButton *buttonEditClose;
@property (nonatomic, strong) ObjectCountdown *countdown;
@end
