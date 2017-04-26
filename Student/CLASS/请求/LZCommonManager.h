//
//  LZCommonManager.h
//  Student
//
//  Created by 白慧峰 on 2017/4/24.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ComeFirstApp,
    ComeCountApp,
} ComeApp;


@interface LZCommonManager : NSObject

@property (nonatomic,strong) NSMutableArray *grandeArr;

+ (LZCommonManager *)shareInstance;

- (void)getGrandInfo;

- (NSArray *)gradeArrInfo;

@end
