//
//  JYAccountTool.h
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 16/3/21.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

//这里是存用户的信息；
#define SWAccountFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.arch"]


@class JYAccount;

@interface JYAccountTool : NSObject
@property (copy,nonatomic) NSString *UserDefaultUkey;

/**
 *  存储帐号
 */
+ (void)save:(JYAccount *)account;

/**
 *  读取帐号
 */
+ (JYAccount *)account;



@end
