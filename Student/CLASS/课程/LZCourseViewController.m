//
//  LZCourseViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/17.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZCourseViewController.h"
#import "LZCourseFirstCell.h"
#import "LZCourseJudgeCell.h"

@interface LZCourseViewController ()

@end

@implementation LZCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _courseListTableView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section % 2) {
        return 154;
    } else {
        return 70;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section % 2) {
        LZCourseFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZCourseFirstCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZCourseFirstCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        LZCourseJudgeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZCourseJudgeCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZCourseJudgeCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
