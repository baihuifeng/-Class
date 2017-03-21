//
//  LZMineViewController.h
//  Student
//
//  Created by 葬花桥 on 2017/3/17.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"

@interface LZMineViewController : LZRootViewController <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *listTableView;

@end
