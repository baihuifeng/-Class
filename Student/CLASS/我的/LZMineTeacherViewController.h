//
//  LZMineTeacherViewController.h
//  Student
//
//  Created by 葬花桥 on 2017/3/23.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"

@interface LZMineTeacherViewController : LZRootViewController <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *mineTeacherList;
@property (weak, nonatomic) IBOutlet UIView *mineSegment;
@end
