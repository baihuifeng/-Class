//
//  LZCourseViewController.h
//  Student
//
//  Created by 葬花桥 on 2017/3/17.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"

@interface LZCourseViewController : LZRootViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *courseListTableView;

@end
