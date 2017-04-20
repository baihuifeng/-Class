//
//  LZRootViewController.h
//  Student
//
//  Created by 葬花桥 on 2017/3/17.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZRootViewController : UIViewController <selectedDelegate>


//头部刷新
- (void)setRefreshHeader:(UITableView *)tableView completion:(void (^)(void))completion;
- (void)refreshRequest;



@end
