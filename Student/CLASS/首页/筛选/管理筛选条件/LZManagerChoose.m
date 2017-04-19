//
//  LZManagerChoose.m
//  Student
//
//  Created by 白慧峰 on 2017/4/19.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZManagerChoose.h"

@implementation LZChooseModel



@end

@implementation LZManagerChoose


+ (NSArray *)getSequenceCondition {

    
    return [LZManagerChoose getChooseCondition:0];
}

+ (NSArray *)getgardeCondition {
    return [LZManagerChoose getChooseCondition:1];

}

+ (NSArray *)getRegionCondition {
    return [LZManagerChoose getChooseCondition:2];
}

+ (NSArray *)getSexCondition {
    
    return [LZManagerChoose getChooseCondition:3];

}

+ (NSArray *)getServiceCondition {
    return [LZManagerChoose getChooseCondition:4];
}
+ (NSArray *)getOtherCondition {
    return [LZManagerChoose getChooseCondition:5];
}

+ (NSArray *)getChooseCondition:(int)caseIndex {

    NSMutableArray *dataArr = [[NSMutableArray alloc] init];
    
    switch (caseIndex) {
        case 0:
            
        {
            NSArray *titleArr = @[@"智能排序",@"距离最近",@"口碑最好",@"价格最高",@"授课最多"];
            NSArray *index = @[@"1",@"2",@"3",@"4",@"5"];
            
            for (int i= 0; i<titleArr.count; i++) {
                LZChooseModel *model = [[LZChooseModel alloc] init];
                model.name = titleArr[i];
                model.code = index[i];
                [dataArr addObject:model];
            }
        
            return dataArr;
        }
        break;
        case 1:
            
        {
            NSArray *titleArr = @[@"一年级",@"二年级",@"三年级",@"四年级",@"五年级"];
            NSArray *index = @[@"1",@"2",@"3",@"4",@"5"];
            
            for (int i= 0; i<titleArr.count; i++) {
                LZChooseModel *model = [[LZChooseModel alloc] init];
                model.name = titleArr[i];
                model.code = index[i];
                [dataArr addObject:model];
            }
            
            return dataArr;
        }
            break;
            
        case 2:
            
        {
            NSArray *titleArr = @[@"东城区",@"西城区",@"朝阳区",@"丰台区",@"海淀区"];
            NSArray *index = @[@"1",@"2",@"3",@"4",@"5"];
            
            for (int i= 0; i<titleArr.count; i++) {
                LZChooseModel *model = [[LZChooseModel alloc] init];
                model.name = titleArr[i];
                model.code = index[i];
                [dataArr addObject:model];
            }
            
            return dataArr;
        }
            break;
        case 3:
            
        {
            NSArray *titleArr = @[@"不限",@"男",@"女"];
            NSArray *index = @[@"1",@"2",@"3"];
            
            for (int i= 0; i<titleArr.count; i++) {
                LZChooseModel *model = [[LZChooseModel alloc] init];
                model.name = titleArr[i];
                model.code = index[i];
                [dataArr addObject:model];
            }
            
            return dataArr;
        }
            break;
        case 4:
            
        {
            NSArray *titleArr = @[@"不限",@"5-10年",@"10-15年"];
            NSArray *index = @[@"1",@"2",@"3"];
            
            for (int i= 0; i<titleArr.count; i++) {
                LZChooseModel *model = [[LZChooseModel alloc] init];
                model.name = titleArr[i];
                model.code = index[i];
                [dataArr addObject:model];
            }
            
            return dataArr;
        }
            break;
        case 5:
            
        {
            NSArray *titleArr = @[@"不限",@"男",@"女"];
            NSArray *index = @[@"1",@"2",@"3"];
            
            for (int i= 0; i<titleArr.count; i++) {
                LZChooseModel *model = [[LZChooseModel alloc] init];
                model.name = titleArr[i];
                model.code = index[i];
                [dataArr addObject:model];
            }
            
            return dataArr;
        }
            break;
            
        default:
            return nil;
            break;
    }
    

}


@end
