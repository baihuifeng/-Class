//
//  LZYuYueViewController.h
//  Student
//
//  Created by 白慧峰 on 2017/4/18.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"
#import "LZYuYueTimeCell.h"

@interface LZYuYueViewController : LZRootViewController

@property (nonatomic,strong) NSArray *dataArr;

@property (strong, nonatomic) IBOutlet UITableView *yuyueTableView;
@end
