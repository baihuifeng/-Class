//
//  LZMineSecondCell.m
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZMineSecondCell.h"
#import "LZMineTeacherViewController.h"
#import "LZMinePurseViewController.h"

@implementation LZMineSecondCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)myTeacher:(UIButton *)sender {
    HHTabbarViewController *tabar = (HHTabbarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    LZMineTeacherViewController *teacherVC = [[LZMineTeacherViewController alloc] init];
    teacherVC.title = @"我的老师";
    [(UINavigationController *)tabar.selectedViewController pushViewController:teacherVC animated:YES];
}
- (IBAction)mypay:(UIButton *)sender {
    HHTabbarViewController *tabar = (HHTabbarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    LZMinePurseViewController *payVC = [[LZMinePurseViewController alloc] init];
//    teacherVC.title = @"我的老师";
    [(UINavigationController *)tabar.selectedViewController pushViewController:payVC animated:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
