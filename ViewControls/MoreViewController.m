//
//  MoreViewController.m
//  ios-猜图达人
//
//  Created by kevin on 13-5-16.
//  Copyright (c) 2013年 mDm. All rights reserved.
//

#import "MoreViewController.h"
#import "ScoreViewController.h"
#import "QBFlatButton.h"

@interface MoreViewController ()

@end

@implementation MoreViewController
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"START"]];
    [self creatEventButton];
	[self creatOrther];


}
- (void)creatEventButton
{
//    UIButton *startbtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    startbtn.frame = CGRectMake(0, 10, 80, 40);
//    
//    [startbtn addTarget:self action:@selector(moreViewToRootView) forControlEvents:UIControlEventTouchUpInside];
//    
//    [startbtn setTitle: @"Home" forState:UIControlStateNormal];
//    [startbtn.titleLabel setFont:[UIFont fontWithName:@"Marion" size:20.0]];
//    [self.view addSubview:startbtn];
    [[QBFlatButton appearance] setFaceColor:[UIColor colorWithWhite:0.75 alpha:1.0] forState:UIControlStateDisabled];
    [[QBFlatButton appearance] setSideColor:[UIColor colorWithWhite:0.55 alpha:1.0] forState:UIControlStateDisabled];
    
    
    QBFlatButton *btnH = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    btnH.frame = CGRectMake(0, 10, 80, 40);
    btnH.faceColor = [UIColor colorWithRed:238.0/255.0 green:152.0/255.0 blue:195.0/255.0 alpha:1.0];
    btnH.sideColor = [UIColor colorWithRed:121/255.0 green:67.0/255.0 blue:207.0/255.0 alpha:0];
    btnH.radius = 8.0;
    btnH.margin = 4.0;
    btnH.depth = 3.0;
    [btnH addTarget:self action:@selector(moreViewToRootView) forControlEvents:UIControlEventTouchUpInside];
    btnH.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [btnH setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnH setTitle:@"Home" forState:UIControlStateNormal];
    [self.view addSubview:btnH];
    

}
- (void)creatOrther
{
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.text = @"切西瓜\n跳跳忍者";
    [self.view addSubview:lbl];
    
}
- (void)moreViewToRootView
{
    [delegate moreView_To_Root:nil];
}

@end
