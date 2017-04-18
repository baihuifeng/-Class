//
//  LZTeacherListCell.m
//  Student
//
//  Created by bai on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZTeacherListCell.h"


@implementation LZTeacherListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}


- (void)setModel:(ListModel *)model {
    _model = model;
    [_imgUrl sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",LZImgUrl,model.imgUrl]] placeholderImage:nil];
    _title.text = model.title;
    _price.text = model.price;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
