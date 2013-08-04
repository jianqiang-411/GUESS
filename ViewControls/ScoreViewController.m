//
//  ScoreViewController.m
//  ios-猜图达人
//
//  Created by kevin on 13-5-16.
//  Copyright (c) 2013年 mDm. All rights reserved.
//

#import "ScoreViewController.h"
#import "DataModel.h"
#import "QBFlatButton.h"
#import <QuartzCore/QuartzCore.h>
static int totalScore = 0;
static int star = 4;

@interface ScoreViewController ()

@end

@implementation ScoreViewController
@synthesize delegate,lbl1,lbl2,lbl3,answerlbl1,answerlbl2;


- (void) viewWillAppear:(BOOL)animated
{
    [self reload];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"START"]];
    [self creatButton];
    [self creatImageViews];
    [self creatLabel];
	
}
- (void)creatButton
{
    [[QBFlatButton appearance] setFaceColor:[UIColor colorWithWhite:0.75 alpha:1.0] forState:UIControlStateDisabled];
    [[QBFlatButton appearance] setSideColor:[UIColor colorWithWhite:0.55 alpha:1.0] forState:UIControlStateDisabled];
    
    QBFlatButton *btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(60, 350, 200, 60);
    btn.faceColor = [UIColor colorWithRed:238.0/255.0 green:152.0/255.0 blue:195.0/255.0 alpha:1.0];
    btn.sideColor = [UIColor colorWithRed:121/255.0 green:67.0/255.0 blue:207.0/255.0 alpha:1.0];
    btn.radius = 8.0;
    btn.margin = 4.0;
    btn.depth = 3.0;
    [btn addTarget:self action:@selector(scoreViewToGameView) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:25];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"下一张" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    
    
    CABasicAnimation *scal = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scal.toValue = [NSNumber numberWithDouble:0.8];
    scal.duration = 0.5;
    scal.autoreverses = YES;
    scal.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scal.repeatCount = FLT_MAX;
    [btn.layer addAnimation:scal forKey:@"transform.scal"];



}
- (void)creatImageViews
{
    UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    img1.image = [UIImage imageNamed:@"xinxin11.png"];
    img1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:img1];
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 220, 50, 50)];
    img2.image = [UIImage imageNamed:@"Doller"];
    [self.view addSubview:img2];
    
    
    CABasicAnimation *flip = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    flip.toValue = [NSNumber numberWithDouble: 2.0*M_PI];
    flip.duration = 2;
    flip.repeatCount = FLT_MAX;
    [img1.layer addAnimation:flip forKey:nil];
    [img2.layer addAnimation:flip forKey:nil];
    
    
}

- (void)creatLabel
{
    answerlbl1 = [[UILabel alloc] initWithFrame:CGRectMake(90, 90, 80, 50)];
    answerlbl1.text = @"答案:";
    answerlbl1.backgroundColor = [UIColor clearColor];
    answerlbl1.textColor = [UIColor yellowColor];
    answerlbl1.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:answerlbl1];
    
    //显示答案
    answerlbl2 = [[UILabel alloc] initWithFrame:CGRectMake(170, 90, 50, 50)];
    answerlbl2.text = nil;
    answerlbl2.backgroundColor = [UIColor clearColor];
    answerlbl2.textColor = [UIColor yellowColor];
    answerlbl2.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:answerlbl2];
    

    //星星值
    lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(170, 155, 50, 40)];
    lbl1.backgroundColor = [UIColor clearColor];
    lbl1.textColor = [UIColor yellowColor];
    lbl1.font = [UIFont fontWithName:@"Helvetica" size:30.0f];
    lbl1.text = @"0";
    [self.view addSubview:lbl1];
    
    //金币值
    lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(170, 225, 50, 40)];
    lbl2.backgroundColor = [UIColor clearColor];
    lbl2.font = [UIFont fontWithName:@"Helvetica" size:30.0f];
    lbl2.textColor = [UIColor yellowColor];
    lbl2.text = @"0";
    [self.view addSubview:lbl2];
    
    
    lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, 240, 100)];
    lbl3.backgroundColor = [UIColor clearColor];
    lbl3.text = nil;
    lbl3.textAlignment = NSTextAlignmentCenter;
    lbl3.textColor = [UIColor colorWithRed:0/255.0 green:0 blue:0/255.0 alpha:1];
    lbl3.font = [UIFont fontWithName:@"Helvetica" size:35.0f];
    [self.view addSubview:lbl3];
}
- (void)reload
{
    if ([DataModel shareDataModel].answer != nil) {
        answerlbl2.text = [DataModel shareDataModel].answer;
    }
    if ([DataModel shareDataModel].isRight) {
        lbl3.text = @"恭喜！答对了";
        lbl1.text = @"+4";
        int a = [[DataModel shareDataModel].star intValue]+star;
        [DataModel shareDataModel].star = [NSString stringWithFormat:@"%i",a];
        totalScore += star*10/4;
        lbl2.text = [NSString stringWithFormat:@"%i",totalScore];
        [DataModel shareDataModel].total = lbl2.text;
        [DataModel shareDataModel].isRight = NO;
    }
    else
    {
        lbl3.text = @"亲！您答错了";
        if (totalScore > 0) {            
            lbl1.text = @"-4";
            int a = [[DataModel shareDataModel].star intValue]-star;
            [DataModel shareDataModel].star = [NSString stringWithFormat:@"%i",a];
            totalScore -= star*10/4;
            lbl2.text = [NSString stringWithFormat:@"%i",totalScore];
            [DataModel shareDataModel].total = lbl2.text;
        }
    }
}
- (void)scoreViewToGameView
{
    [delegate scoreView_To_GameView:nil];
}
- (void)viewDidDisappear:(BOOL)animated
{
    lbl1.text = nil;
    answerlbl2.text = nil;
}
@end
