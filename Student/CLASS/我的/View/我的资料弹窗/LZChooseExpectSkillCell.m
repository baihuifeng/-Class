//
//  LZChooseExpectSkillCell.m
//  Student
//
//  Created by 白慧峰 on 2017/4/25.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZChooseExpectSkillCell.h"

@implementation LZChooseExpectSkillCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)choose:(UIButton *)sender {
    sender.selected = !sender.selected;
    [self.delegate chooseSubjectDelegate:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
