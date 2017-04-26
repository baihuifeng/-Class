//
//  LZMineYXViewController.h
//  Student
//
//  Created by bai on 2017/3/27.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"

@interface LZMineYXViewController : LZRootViewController

@property (nonatomic,strong) JYAccount *model;
@property (nonatomic,assign) ComeApp comeApp;

@property (nonatomic,strong) UIImage *img;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
