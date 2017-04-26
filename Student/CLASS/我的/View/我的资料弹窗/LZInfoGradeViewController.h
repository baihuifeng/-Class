//
//  LZInfoGradeViewController.h
//  Student
//
//  Created by 白慧峰 on 2017/4/24.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"
#import "LZManagerChoose.h"

@interface LZInfoGradeViewController : LZRootViewController

- (void)setGradeName:(NSString *)name biaoshi:(NSString *)biaoshi;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

///回调
@property (nonatomic, copy) void (^chooseModelBlock) (NSString *biaoshi , LZChooseModel *chooseModel);

@property (nonatomic, copy) void (^chooseSubjectModelBlock) (NSArray *chooseArr);


@end
