//
//  BJQGameViewController.h
//  ios-猜图达人
//
//  Created by mDm on 13-5-15.
//  Copyright (c) 2013年 mDm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameDelegate.h"
@interface BJQGameViewController : UIViewController
@property (assign, nonatomic) id<GameDelegate>delegate;
@property (strong, nonatomic) UISegmentedControl *myseg;
@property (retain, nonatomic) NSString *answerStr;
@property (strong, nonatomic) UILabel *scorelbl;
@property (strong, nonatomic) UILabel *totallbl;

@end
