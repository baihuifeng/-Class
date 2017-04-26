//
//  LZCommonManager.m
//  Student
//
//  Created by 白慧峰 on 2017/4/24.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZCommonManager.h"
#import "LZManagerChoose.h"

@implementation LZCommonManager

+ (LZCommonManager *)shareInstance {
    
    static LZCommonManager *homeTags = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        homeTags = [[LZCommonManager alloc] init];
        
        
    });
    
    return homeTags;
}

- (void)getGrandInfo {
    [NetApiManager getFromURL:LZGradeInfo params:nil finished:^(NetResponse *netResponse) {
        _grandeArr = [[NSMutableArray alloc] init];
        for (NSDictionary *grade in netResponse.responseObject[@"data"]) {
            
            LZChooseModel *model = [[LZChooseModel alloc] init];
            model.name = grade[@"gradeName"];
            model.code = grade[@"id"];
            [_grandeArr addObject:model];
            
        }
        
        
    }];
 
}

- (NSArray *)gradeArrInfo {
    if (!_grandeArr) {
        [self getGrandInfo];
        return nil;
    }
    
    return _grandeArr;
}

@end
