//
//  LZMineFirstCell.m
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZMineFirstCell.h"

@implementation LZMineFirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setHeadImg:(UIImageView *)headImg {
    _headImg = headImg;
    _headImg.layer.borderWidth = 1.5;
    _headImg.layer.borderColor = UICOLOR_RGB_Alpha(0x23CD77, 1.0).CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
