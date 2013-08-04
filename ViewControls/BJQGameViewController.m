//
//  BJQGameViewController.m
//  ios-猜图达人
//
//  Created by mDm on 13-5-15.
//  Copyright (c) 2013年 mDm. All rights reserved.
//

#import "BJQGameViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DataModel.h"
#import "QBFlatButton.h"
static NSInteger imgIndex;
@interface BJQGameViewController ()

@end

@implementation BJQGameViewController
@synthesize myseg,delegate,answerStr,scorelbl,totallbl;

- (void)viewWillAppear:(BOOL)animated
{
    [self creatMidle];
    [self creatSegment];
    [self loadLblData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"START"]];
    ;
    //随机一个图片，依次递增
    imgIndex = arc4random()%[[DataModel shareDataModel].answerArr count];
    [self creatHeader];
    [self creatButton];
    
}
#pragma mark - 
#pragma mark 创建屏幕顶部的View 和 按钮 图片
- (void)creatHeader
{
    UIView *headBack = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    headBack.backgroundColor = [UIColor purpleColor];
    headBack.alpha = 0.5;    
    [self.view addSubview:headBack];
    
    scorelbl = [[UILabel alloc] initWithFrame:CGRectMake(105, 5, 25, 25)];
    scorelbl.backgroundColor = [UIColor clearColor];
    scorelbl.textColor = [UIColor yellowColor];
    scorelbl.font = [UIFont fontWithName:@"Helvetica" size:20.0f];
    [self.view insertSubview:scorelbl atIndex:10];
    
    totallbl = [[UILabel alloc] initWithFrame:CGRectMake(220, 5, 25, 25)];
    totallbl.backgroundColor = [UIColor grayColor];
    totallbl.backgroundColor = [UIColor clearColor];
    totallbl.textColor = [UIColor yellowColor];
    totallbl.font = [UIFont fontWithName:@"Helvetica" size:20.0f];
    [self.view insertSubview:totallbl atIndex:10];
    
    
    //header imageViews
    UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(70, 0, 32, 32)];
    img1.image = [UIImage imageNamed:@"xinxin11"];
    [self.view addSubview:img1];
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(180, 2, 32, 32)];
    img2.backgroundColor = [UIColor clearColor];
    img2.image = [UIImage imageNamed:@"Doller"];
    [self.view addSubview:img2];
}


#pragma mark -
#pragma mark 创建屏幕中间的图片
- (void)creatMidle
{
    //mid imageView
    UIView *myview = [[UIView alloc] initWithFrame:CGRectMake(10, 60, 300, 300)];
    myview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:myview];
    
    UIImageView *imgv1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    
    answerStr = [[DataModel shareDataModel].answerArr objectAtIndex:imgIndex];
    
    imgIndex++;
    if (imgIndex > [[DataModel shareDataModel].answerArr count]-1) {
        imgIndex = 0;
    }
    [DataModel shareDataModel].answer = answerStr;
    
    imgv1.image = [[DataModel shareDataModel].imagDic objectForKey:answerStr];
    [myview addSubview:imgv1];
 
}

#pragma mark -
#pragma mark 创建分段按钮
- (void)creatSegment
{
   
    NSArray *arr = [DataModel shareDataModel].totolArr;
    NSInteger acount = [arr count];
    NSMutableArray *tempMuArr1 = [NSMutableArray array];
    NSMutableArray *tempMuArr2 = [NSMutableArray array];
    while ([tempMuArr1 count] < 4)
    {
        
        NSInteger num = arc4random()%acount;        
        NSString *temp = [arr objectAtIndex:num];
        if ([tempMuArr1 count] == 0) {
            [tempMuArr1 addObject:answerStr];
        }
        if ([tempMuArr1 containsObject:temp])
            ;
        else
            [tempMuArr1 addObject:temp];
    }
    
    //将4个选项随即排列
    while ([tempMuArr2 count] < 4)
    {
        
        NSInteger num = arc4random()%4;
        NSString *temp = [tempMuArr1 objectAtIndex:num];
        
        if ([tempMuArr2 count] == 0) {
            [tempMuArr2 addObject:temp];
        }
        if ([tempMuArr2 containsObject:temp])
            ;
        else
            [tempMuArr2 addObject:temp];
    }
    
    myseg = [[UISegmentedControl alloc] initWithItems:tempMuArr2];
    myseg.frame = CGRectMake(10, 370, 300, 40);
    myseg.segmentedControlStyle = UISegmentedControlStyleBar;
    myseg.tintColor = [UIColor colorWithRed:1 green:0.2 blue:0.2 alpha:0.8];
    myseg.apportionsSegmentWidthsByContent = YES;
    [myseg addTarget:self action:@selector(clickSegmentButton) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:myseg];
    
 } 
#pragma mark -
#pragma mark 点击按钮事件
- (void)clickSegmentButton
{
    NSInteger index = myseg.selectedSegmentIndex;
    
            
    if ([answerStr isEqualToString:[myseg titleForSegmentAtIndex:index]]) {
        [DataModel shareDataModel].isRight = YES;        
    }
    else
        [DataModel shareDataModel].isRight = NO;
    
}

- (void)loadLblData
{
    if ([[DataModel shareDataModel].star intValue] == 0) {
        scorelbl.text = @"0";
    }
    else
        scorelbl.text = [DataModel shareDataModel].star;
    
    if ([[DataModel shareDataModel].total intValue] == 0) {
        totallbl.text = @"0";
    }
    else    
        totallbl.text = [DataModel shareDataModel].total;
}
#pragma mark -
#pragma mark 创建视图切换按钮
- (void)creatButton
{
    //1.返回主菜单按钮
    [[QBFlatButton appearance] setFaceColor:[UIColor colorWithWhite:0.75 alpha:1.0] forState:UIControlStateDisabled];
    [[QBFlatButton appearance] setSideColor:[UIColor colorWithWhite:0.55 alpha:1.0] forState:UIControlStateDisabled];
    
    
    QBFlatButton *btnH = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    btnH.frame = CGRectMake(0, 10, 50, 30);
    btnH.faceColor = [UIColor colorWithRed:238.0/255.0 green:152.0/255.0 blue:195.0/255.0 alpha:1.0];
    btnH.sideColor = [UIColor colorWithRed:121/255.0 green:67.0/255.0 blue:207.0/255.0 alpha:0];
    btnH.radius = 8.0;
    btnH.margin = 4.0;
    btnH.depth = 3.0;
    [btnH addTarget:self action:@selector(gameViewToRootView) forControlEvents:UIControlEventTouchUpInside];
    btnH.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [btnH setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnH setTitle:@"Home" forState:UIControlStateNormal];
    [self.view addSubview:btnH];

    //btn2
    
    QBFlatButton *btnHR = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    btnHR.frame = CGRectMake(270, 10, 50, 30);
    btnHR.faceColor = [UIColor colorWithRed:238.0/255.0 green:152.0/255.0 blue:195.0/255.0 alpha:1.0];
    btnHR.sideColor = [UIColor colorWithRed:121/255.0 green:67.0/255.0 blue:207.0/255.0 alpha:0];
    btnHR.radius = 8.0;
    btnHR.margin = 4.0;
    btnHR.depth = 3.0;
    [btnHR addTarget:self action:@selector(gameViewToMoreView) forControlEvents:UIControlEventTouchUpInside];
    btnHR.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [btnHR setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnHR setTitle:@"More" forState:UIControlStateNormal];
    [self.view addSubview:btnHR];
//    UIButton *headbtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    headbtn2.frame = CGRectMake(270, 10, 50, 30);
//    [headbtn2 setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
//    [headbtn2 setTitle: @"More" forState:UIControlStateNormal];
//    [headbtn2 addTarget:self action:@selector(gameViewToMoreView) forControlEvents:UIControlEventTouchUpInside];
//    [headbtn2.titleLabel setFont:[UIFont fontWithName:@"Marion" size:14.0]];
//    [self.view addSubview:headbtn2];
    
    //3.跳转到评分视图按钮
//    UIButton *nextbtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    nextbtn.frame = CGRectMake(200, 415, 100, 40);
//    [nextbtn addTarget:self action:@selector(gameViewToScoreView) forControlEvents:UIControlEventTouchUpInside];
//    [nextbtn setTitle: @"确定" forState:UIControlStateNormal];
//    [nextbtn setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
//    [nextbtn.titleLabel setFont:[UIFont fontWithName:@"Marion" size:14.0]];
//    [self.view addSubview:nextbtn];
//    [[QBFlatButton appearance] setFaceColor:[UIColor colorWithWhite:0.75 alpha:1.0] forState:UIControlStateDisabled];
//    [[QBFlatButton appearance] setSideColor:[UIColor colorWithWhite:0.55 alpha:1.0] forState:UIControlStateDisabled];
    
    
    QBFlatButton *btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(200, 415, 100, 40);
    btn.faceColor = [UIColor colorWithRed:238.0/255.0 green:152.0/255.0 blue:195.0/255.0 alpha:1.0];
    btn.sideColor = [UIColor colorWithRed:121/255.0 green:67.0/255.0 blue:207.0/255.0 alpha:.5];
    btn.radius = 8.0;
    btn.margin = 4.0;
    btn.depth = 3.0;
    [btn addTarget:self action:@selector(gameViewToScoreView) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:25];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"OK" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
}

#pragma mark -
#pragma mark 视图控制器跳转
- (void)gameViewToScoreView
{
    [delegate gameView_To_ScoreView:nil];
}
- (void)gameViewToRootView
{
    [delegate gameView_To_RootView:nil];
}
- (void)gameViewToMoreView
{
    [delegate gameView_To_MoretView:nil];
}

@end
