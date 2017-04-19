//
//  LZManagerChoose.h
//  Student
//
//  Created by 白慧峰 on 2017/4/19.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZChooseModel : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *code;

@end

@interface LZManagerChoose : NSObject

+ (NSArray *)getSequenceCondition;//排序

+ (NSArray *)getgardeCondition;//年级

+ (NSArray *)getRegionCondition;//区域筛选

+ (NSArray *)getSexCondition;//性别
+ (NSArray *)getServiceCondition;//教龄
+ (NSArray *)getOtherCondition;//其他
@end


