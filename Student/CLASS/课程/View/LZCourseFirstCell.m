//
//  LZCourseFirstCell.m
//  Student
//
//  Created by bai on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZCourseFirstCell.h"

@implementation LZCourseFirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(LZCourseModel *)model index:(NSInteger)index {
    _model = model;
    _teacherName.text = model.teacherName;
    _teachSkill.text = model.teachSkill;
    _price.text = [NSString stringWithFormat:@"老师课酬：%@",model.price];
    _unit.text = model.unit;
    _address.text = [NSString stringWithFormat:@"上课地址：%@",model.address];
    
    if (index == 0) {
        if ([model.status isEqualToString:@"0"]) {
            [_stateBtn setTitle:@"等待老师同意" forState:UIControlStateNormal];
            [_stateBtn setTitleColor:UICOLOR_RGB_Alpha(0xF5A623, 1.0) forState:UIControlStateNormal];
            
        } else if ([model.status isEqualToString:@"1"]) {
            [_stateBtn setTitle:@"老师已同意等待上课" forState:UIControlStateNormal];
            [_stateBtn setTitleColor:UICOLOR_RGB_Alpha(0x23cd77, 1.0) forState:UIControlStateNormal];
        }
    } else if (index == 1) {
        
        [_stateBtn setTitle:[NSString stringWithFormat:@" 去支付：%@ ",model.price] forState:UIControlStateNormal];
        [_stateBtn setTitleColor:UICOLOR_RGB_Alpha(0xF5A623, 1.0) forState:UIControlStateNormal];
        _stateBtn.layer.cornerRadius = 4;
        _stateBtn.layer.borderWidth = 0.5;
        _stateBtn.layer.borderColor =UICOLOR_RGB_Alpha(0xF5A623, 1.0).CGColor;
            
    }
    

    
    
}

+ (CGFloat)tabViewCellHeight:(LZCourseModel *)model {
    
    return [NSString stringSizeWithString:model.address maxSize:CGSizeMake(kScreen_Width-30, CGFLOAT_MAX) wordFont:12].height+152;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
