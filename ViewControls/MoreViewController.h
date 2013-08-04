//
//  MoreViewController.h
//  ios-猜图达人
//
//  Created by kevin on 13-5-16.
//  Copyright (c) 2013年 mDm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreDelegate.h"
@interface MoreViewController : UIViewController
@property(assign, nonatomic) id<MoreDelegate>delegate;
@end
