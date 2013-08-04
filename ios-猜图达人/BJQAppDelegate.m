//
//  BJQAppDelegate.m
//  ios-猜图达人
//
//  Created by mDm on 13-5-15.
//  Copyright (c) 2013年 mDm. All rights reserved.
//

#import "BJQAppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "BJQRootViewController.h"
#import "BJQGameViewController.h"
#import "ScoreViewController.h"
#import "MoreViewController.h"
@implementation BJQAppDelegate
@synthesize root,gameVC,scoreVC,moreVC;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    root = [[BJQRootViewController alloc] init];
    root.delegate = self;
    //////////////////////////////////////////////////
    //////////////////////////////////////////////////
    gameVC = [[BJQGameViewController alloc] init];
    gameVC.delegate = self;
    
    scoreVC = [[ScoreViewController alloc] init];
    scoreVC.delegate = self;
    
    moreVC = [[MoreViewController alloc] init];
    moreVC.delegate = self;
    //////////////////////////////////////////////////
    //////////////////////////////////////////////////
    
    self.window.rootViewController = root;
    [self.window makeKeyAndVisible];
    return YES;
}
#pragma mark - 
#pragma mark 自定义 RootDelegate 方法
- (void)rooView_To_GameView:(id)sender
{
    CATransition *myAnimation = [CATransition animation];
    myAnimation.type = @"suckEffect";
    myAnimation.subtype = kCATransitionFromRight;
    myAnimation.duration = 0.7;
    self.window.rootViewController = gameVC;
    [self.window.layer addAnimation:myAnimation forKey:@"myAnimation"];
    
}
#pragma mark -
#pragma mark 自定义 GameDelegate 方法
- (void)gameView_To_RootView:(id)sender
{
    CATransition *myAnimation = [CATransition animation];
    myAnimation.type = kCATransitionPush;
    myAnimation.subtype = kCATransitionFromLeft;
    myAnimation.duration = 0.7;
    myAnimation.timingFunction = UIViewAnimationCurveEaseInOut;
    self.window.rootViewController = root;
    [self.window.layer addAnimation:myAnimation forKey:@"myAnimation"];
}
- (void)gameView_To_ScoreView:(id)sender
{
    CATransition *myAnimation = [CATransition animation];
    myAnimation.type = @"rippleEffect";
    myAnimation.subtype = kCATransitionFromBottom;
    myAnimation.duration = 0.7;
    myAnimation.timingFunction = UIViewAnimationCurveEaseInOut;
    self.window.rootViewController = scoreVC;
    [self.window.layer addAnimation:myAnimation forKey:@"myAnimation"];
    self.window.rootViewController = scoreVC;
}
- (void)gameView_To_MoretView:(id)sender
{
    CATransition *myAnimation = [CATransition animation];
    myAnimation.type = @"cameraIrisHollowOpen";
    myAnimation.subtype = kCATransitionFromRight;
    myAnimation.duration = 0.7;
    myAnimation.timingFunction = UIViewAnimationCurveEaseInOut;
    self.window.rootViewController = moreVC;
    [self.window.layer addAnimation:myAnimation forKey:@"myAnimation"];
   
}
#pragma mark -
#pragma mark 自定义 ScoreDelegate 方法
- (void) scoreView_To_GameView:(id)sender
{
    CATransition *myAnimation = [CATransition animation];
    myAnimation.type = @"cube";
    myAnimation.subtype = kCATransitionFromRight;
    myAnimation.duration = 0.7;
    myAnimation.timingFunction = UIViewAnimationCurveEaseInOut;
    self.window.rootViewController = gameVC;
    [self.window.layer addAnimation:myAnimation forKey:@"myAnimation"];
   
}
#pragma mark -
#pragma mark 自定义 MoreDelegate 方法
- (void) moreView_To_Root:(id)sender
{
    CATransition *myAnimation = [CATransition animation];
    myAnimation.type = @"cameraIrisHollowClose";
    myAnimation.subtype = kCATransitionFromLeft;
    myAnimation.duration = 0.7;
    myAnimation.timingFunction = UIViewAnimationCurveEaseInOut;
    self.window.rootViewController = root;
    [self.window.layer addAnimation:myAnimation forKey:@"myAnimation"];
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
