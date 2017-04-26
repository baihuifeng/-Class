//
//  LZMineDetailViewController.h
//  Student
//
//  Created by 葬花桥 on 2017/3/23.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZMineDetailViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *mineInfoTableView;
@property (nonatomic,strong) JYAccount *model;

@property (nonatomic,assign) ComeApp comeApp;
@end
