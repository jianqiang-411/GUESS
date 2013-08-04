//
//  ScoreViewController.h
//  ios-猜图达人
//
//  Created by kevin on 13-5-16.
//  Copyright (c) 2013年 mDm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreDelegate.h"
@interface ScoreViewController : UIViewController
@property (assign, nonatomic) id<ScoreDelegate>delegate;
@property (strong, nonatomic) UILabel *lbl1;
@property (strong, nonatomic) UILabel *lbl2;
@property (strong, nonatomic) UILabel *lbl3;
@property (strong, nonatomic) UILabel *answerlbl1;
@property (strong, nonatomic) UILabel *answerlbl2;
@end
