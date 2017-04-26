//
//  LZHomeFourCell.m
//  Student
//
//  Created by bai on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZHomeFourCell.h"
#import "LZTeacherListCell.h"
#import "LZTeacherDetailViewController.h"
#import "LZClassesViewController.h"


@implementation LZHomeFourCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    
}

- (void)setDataArr:(NSArray *)dataArr teacherModel:(LZHomeModel *)model {
    _dataArr = dataArr;
    _listmodel = model;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView reloadData];
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 105;  //570
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    LZTeacherListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZTeacherListCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LZTeacherListCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = _dataArr[indexPath.row];
    return cell;
       
}
- (IBAction)moreClassBtn:(UIButton *)sender {
    
    HHTabbarViewController *tabar = (HHTabbarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    LZClassesViewController *classVc = [[LZClassesViewController alloc] init];
    classVc.listModel = _listmodel;
    [(UINavigationController *)tabar.selectedViewController pushViewController:classVc animated:YES];
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ListModel *model = _dataArr[indexPath.row];
    HHTabbarViewController *tabar = (HHTabbarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    LZTeacherDetailViewController *teacherVc = [[LZTeacherDetailViewController alloc] init];
    teacherVc.teacherId = model.userID;
    [(UINavigationController *)tabar.selectedViewController pushViewController:teacherVc animated:YES];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
