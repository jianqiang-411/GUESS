//
//  DataModel.m
//  ios-猜图达人
//
//  Created by mDm on 13-5-15.
//  Copyright (c) 2013年 mDm. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
@synthesize totolArr,imagDic,answerArr,isRight,answer,star,total;

static DataModel *dataModel = nil;
+ (DataModel *)shareDataModel
{
    @synchronized (self)
    {
        if (dataModel == nil) {
            dataModel = [[DataModel alloc] init];
        }
    }
    return dataModel;
}

- (id)init
{
    self = [super init];
    if (self != nil) {
        totolArr = [NSArray arrayWithObjects:@"荷兰",@"瑞典",@"挪威",@"冰岛",@"中国",@"美国",nil];
        answerArr = [NSArray arrayWithObjects:@"荷兰",@"瑞典",@"挪威",@"冰岛",nil];
        imagDic = [NSDictionary dictionaryWithObjectsAndKeys:
                   [UIImage imageNamed:@"helan.png"],@"荷兰",
                   [UIImage imageNamed:@"ruidian.png"],@"瑞典",
                   [UIImage imageNamed:@"nuowei.png"],@"挪威",
                   [UIImage imageNamed:@"bingdao.png"],@"冰岛",
                   nil];
    }
    return self;
}
@end
