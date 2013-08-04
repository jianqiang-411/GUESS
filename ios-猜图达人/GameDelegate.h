//
//  GameDelegate.h
//  ios-猜图达人
//
//  Created by kevin on 13-5-16.
//  Copyright (c) 2013年 mDm. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GameDelegate <NSObject>
- (void)gameView_To_RootView:(id)sender;
- (void)gameView_To_ScoreView:(id)sender;
- (void)gameView_To_MoretView:(id)sender;
@end
