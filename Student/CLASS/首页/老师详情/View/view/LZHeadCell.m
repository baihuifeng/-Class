//
//  LZHeadCell.m
//  Student
//
//  Created by 葬花桥 on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZHeadCell.h"

@implementation LZHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(LZDetailModel *)model {
    _model = model;
    _nickName.text = model.nickName;
    _priceDescribe.text = model.priceDescribe;
}
        
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
