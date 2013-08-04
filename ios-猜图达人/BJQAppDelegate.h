//
//  BJQAppDelegate.h
//  ios-猜图达人
//
//  Created by mDm on 13-5-15.
//  Copyright (c) 2013年 mDm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootDelegate.h"
#import "GameDelegate.h"
#import "ScoreDelegate.h"
#import "MoreDelegate.h"
@class BJQRootViewController;
@class BJQGameViewController;
@class ScoreViewController;
@class MoreViewController;
@interface BJQAppDelegate : UIResponder <UIApplicationDelegate,RootDelegate,GameDelegate,ScoreDelegate,MoreDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) BJQRootViewController *root;
@property (strong, nonatomic) BJQGameViewController *gameVC;
@property (strong, nonatomic) ScoreViewController *scoreVC;
@property (strong, nonatomic) MoreViewController *moreVC;
@end
