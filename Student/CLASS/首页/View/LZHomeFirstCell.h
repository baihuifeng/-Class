//
//  LZHomeFirstCell.h
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
@interface LZHomeFirstCell : UITableViewCell <SDCycleScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *headView;
@property (assign,nonatomic) int index;

@end
