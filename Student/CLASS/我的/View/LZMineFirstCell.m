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

- (void)setModel:(JYAccount *)model {
    _model = model;
    NSLog(@"=====%@",[NSString stringWithFormat:@"%@%@",ManagerUrl,_model.headImgUrl]);
    
    [_headImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ManagerUrl,_model.headImgUrl]] placeholderImage:nil];
    
    [_backHeadImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ManagerUrl,_model.headImgUrl]] placeholderImage:nil];
    
    _backHeadImg.transform = CGAffineTransformScale(_headImg.transform, 10, 10);
    
    UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *view = [[UIVisualEffectView alloc] initWithEffect:beffect];
    view.alpha = 0.7;
    view.frame = CGRectMake(0, 0, kScreen_Width, 160);
    
    [self.backView addSubview:view];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
