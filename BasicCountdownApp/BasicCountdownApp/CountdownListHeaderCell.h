//
//  CountdownListHeaderCell.h
//  BasicCountdownApp
//
//  Created by Joe Cortopassi on 11/24/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateSubView.h"


@class Model;



@interface CountdownListHeaderCell : UITableViewCell <DelegateSubView>
@property (nonatomic, weak) id<DelegateSubView> delegateSubView;
@property (nonatomic, strong) Model *model;
@end
