//
//  BJQRootViewController.h
//  ios-猜图达人
//
//  Created by mDm on 13-5-15.
//  Copyright (c) 2013年 mDm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootDelegate.h"
@class BJQGameViewController;
@interface BJQRootViewController : UIViewController
@property (assign, nonatomic) id<RootDelegate>delegate;

@end
