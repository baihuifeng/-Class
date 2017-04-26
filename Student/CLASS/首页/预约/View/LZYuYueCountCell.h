//
//  LZYuYueCountCell.h
//  Student
//
//  Created by 白慧峰 on 2017/4/18.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZYuYueCountCell : UITableViewCell 
@property (weak, nonatomic) IBOutlet UIButton *jian;
@property (weak, nonatomic) IBOutlet UIButton *jia;

@property (weak, nonatomic) IBOutlet UITextField *countText;

///筛选结果回调
@property (nonatomic, copy) void (^filterResultBlock) (int count);

@end
