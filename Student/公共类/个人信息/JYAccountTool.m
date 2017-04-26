//
//  JYAccountTool.m
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 16/3/21.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "JYAccountTool.h"




@implementation JYAccountTool



+ (void)save:(JYAccount *)account
{
    // 归档
    [NSKeyedArchiver archiveRootObject:account toFile:SWAccountFilepath];
}

+ (JYAccount *)account
{
    // 读取帐号
    JYAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:SWAccountFilepath];
    
 
    return account;
}



@end
