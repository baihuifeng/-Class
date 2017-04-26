//
//  LZYuYueAddressCell.m
//  Student
//
//  Created by 白慧峰 on 2017/4/18.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZYuYueAddressCell.h"

@implementation LZYuYueAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setAddressText:(QIAOTextView *)addressText {
    _addressText = addressText;
    _addressText.layer.borderColor = UICOLOR_RGB_Alpha(0Xb5b5b5, 1.0).CGColor;
    _addressText.layer.borderWidth = 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
