//
//  BJQRootViewController.m
//  ios-猜图达人
//
//  Created by mDm on 13-5-15.
//  Copyright (c) 2013年 mDm. All rights reserved.
//

#import "BJQRootViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "BJQGameViewController.h"
#import "QBFlatButton.h"
@interface BJQRootViewController ()

@end

@implementation BJQRootViewController
@synthesize delegate;


- (void)viewDidLoad
{
    [super viewDidLoad];
	[self startView];
    
}

- (void)startView
{
    //背景图片
    UIView *aview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];    
    aview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"START"]];   
    [self.view addSubview:aview];
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(60, 50, 200, 200)];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.text = @"猜...";
    lbl.textColor = [UIColor colorWithRed:0 green:0 blue:62/255.0 alpha:1];
    lbl.font = [UIFont fontWithName:@"Helvetica" size:100.0f];  
    [self.view addSubview:lbl];
    
    
    //开始按钮
    
    
    [[QBFlatButton appearance] setFaceColor:[UIColor colorWithWhite:0.75 alpha:1.0] forState:UIControlStateDisabled];
    [[QBFlatButton appearance] setSideColor:[UIColor colorWithWhite:0.55 alpha:1.0] forState:UIControlStateDisabled];
    
    QBFlatButton *btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(60, 350, 200, 60);
    btn.faceColor = [UIColor colorWithRed:238.0/255.0 green:152.0/255.0 blue:195.0/255.0 alpha:1.0];
    btn.sideColor = [UIColor colorWithRed:121/255.0 green:67.0/255.0 blue:207.0/255.0 alpha:1.0];
    btn.radius = 8.0;
    btn.margin = 4.0;
    btn.depth = 3.0;
    [btn addTarget:self action:@selector(switchViewC) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:25];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"Start Game" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    
    
    CABasicAnimation *scal = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scal.toValue = [NSNumber numberWithDouble:0.8];
    scal.duration = 0.5;
    scal.autoreverses = YES;
    scal.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scal.repeatCount = FLT_MAX;
    [btn.layer addAnimation:scal forKey:@"transform.scale"];

}

-(void) switchViewC
{
    [delegate rooView_To_GameView:nil];

}
@end
