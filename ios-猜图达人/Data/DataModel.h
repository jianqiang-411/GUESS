//
//  DataModel.h
//  ios-猜图达人
//
//  Created by mDm on 13-5-15.
//  Copyright (c) 2013年 mDm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
{
    NSArray *totolArr;
    NSArray *answerArr;
    NSDictionary *imagDic;
    BOOL isRight;
    NSString *answer;
}
@property (retain, nonatomic) NSArray *totolArr;
@property (retain, nonatomic) NSString *answer;
@property (retain, nonatomic) NSString *star;
@property (retain, nonatomic) NSString *total;
@property (retain, nonatomic) NSArray *answerArr;
@property (retain, nonatomic) NSDictionary *imagDic;
@property (assign, nonatomic) BOOL isRight;
+ (DataModel *)shareDataModel;
@end
