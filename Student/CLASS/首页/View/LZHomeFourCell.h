//
//  LZHomeFourCell.h
//  Student
//
//  Created by bai on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZTeacherListModel.h"

@interface LZHomeFourCell : UITableViewCell <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSArray *dataArr;
@property (nonatomic,strong)LZHomeModel *listmodel;

- (void)setDataArr:(NSArray *)dataArr teacherModel:(LZHomeModel *)model;

@end
