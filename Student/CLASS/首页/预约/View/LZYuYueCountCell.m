//
//  LZYuYueCountCell.m
//  Student
//
//  Created by 白慧峰 on 2017/4/18.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZYuYueCountCell.h"

@implementation LZYuYueCountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)jian:(UIButton *)sender {
    
    if ([_countText.text intValue] <= 1) {
        _countText.text = @"1";
        _jian.enabled = NO;
    } else {
        _countText.text = [NSString stringWithFormat:@"%d",[_countText.text intValue]-1];
        _jian.enabled = YES;
    }
    
    
    if (self.filterResultBlock) {
        self.filterResultBlock([_countText.text intValue]);
    }
    
}
- (IBAction)jia:(UIButton *)sender {
    
    _countText.text = [NSString stringWithFormat:@"%d",[_countText.text intValue]+1];
    
    if ([_countText.text intValue] < 1) {
        _countText.text = @"1";
        _jian.enabled = NO;
    } else {
        _jian.enabled = YES;
    }
    
    if (!self.filterResultBlock) {
        self.filterResultBlock([_countText.text intValue]);
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
