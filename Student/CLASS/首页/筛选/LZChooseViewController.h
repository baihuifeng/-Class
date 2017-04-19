//
//  LZChooseViewController.h
//  Student
//
//  Created by 白慧峰 on 2017/4/19.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"

@interface LZChooseViewController : LZRootViewController

@property (nonatomic,assign) int index;

- (void)dataArr:(NSArray *)dataArr selectedIndex:(int)selectedIndex;

///回调
@property (nonatomic, copy) void (^rowBlock) (NSInteger index);


- (void)moreViewIndex:(int)index;



@end
