//
//  LZMinePurseSecondCell.m
//  Student
//
//  Created by 葬花桥 on 2017/4/6.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZMinePurseSecondCell.h"
#import "LZProfitDetailViewController.h"

@implementation LZMinePurseSecondCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)mingxi:(UIButton *)sender {
    
    HHTabbarViewController *tabar = (HHTabbarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    LZProfitDetailViewController *payvc = [[LZProfitDetailViewController alloc] init];
    payvc.title = @"收益明细";
    [(UINavigationController *)tabar.selectedViewController pushViewController:payvc animated:YES];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
