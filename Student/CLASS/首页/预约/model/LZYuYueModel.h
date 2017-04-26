//
//  LZYuYueModel.h
//  Student
//
//  Created by 白慧峰 on 2017/4/25.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZYuYueModel : NSObject

@property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *teacherId;
@property (nonatomic,copy) NSString *priceId;
@property (nonatomic,strong) NSArray *skillName;
@property (nonatomic,strong) NSArray *gradeName;
@property (nonatomic,copy) NSString *startTime;
@property (nonatomic,copy) NSString *times;
@property (nonatomic,copy) NSString *address;

@end
