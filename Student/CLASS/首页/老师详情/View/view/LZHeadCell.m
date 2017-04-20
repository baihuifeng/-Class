//
//  LZHeadCell.m
//  Student
//
//  Created by 葬花桥 on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZHeadCell.h"
#import "LZTagsView.h"

@implementation LZHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(LZDetailModel *)model {
    _model = model;
    _nickName.text = model.nickName;
    _priceDescribe.text = model.priceDescribe;
    _headImg.userInteractionEnabled = YES;
    [_headImg addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImgview)]];
    
    [_headImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ManagerUrl,model.imgUrl]] placeholderImage:nil];
    
//    UILabel *testLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 320, 30)];
//    
//    testLabel.backgroundColor = [UIColor lightGrayColor];
//    
//    testLabel.textAlignment = NSTextAlignmentCenter;

    NSString *timeStr = [NSString stringWithFormat:@"授课时长%@",model.teachingTime];
    _timeLabel.attributedText = [self attribuedStrring:timeStr Range:NSMakeRange(4, timeStr.length-4) font:[UIFont systemFontOfSize:25.0]];
    
    NSString *stdengCountStr = [NSString stringWithFormat:@"学生数%@",model.studensCount];
    _studensCount.attributedText = [self attribuedStrring:stdengCountStr Range:NSMakeRange(3, stdengCountStr.length-3) font:[UIFont systemFontOfSize:25.0]];
    NSString *teachingAge = [NSString stringWithFormat:@"累计教龄%@年",model.teachingAge];
    _teachingAge.attributedText = [self attribuedStrring:teachingAge Range:NSMakeRange(4, teachingAge.length-5) font:[UIFont systemFontOfSize:25.0]];
    NSString *satisfaction = [NSString stringWithFormat:@"满意度%@",model.satisfaction];
    _satisfaction.attributedText = [self attribuedStrring:satisfaction Range:NSMakeRange(3, satisfaction.length-3) font:[UIFont systemFontOfSize:35.0]];
    
    
    
    int Xstar = 5;
    
    
    int limit = kScreen_Width-26;
    for (NSString *tagStr in model.certificationTags) {
        
        CGFloat lablelWidth = [LZTagsView getTagLabelWidth:tagStr];
        
        if ((Xstar + lablelWidth+15)>limit) {
            return;
        }
        else {
            [self.certificationTagsView addSubview:[LZTagsView certificationTagsView:@"certification_icon" title:tagStr x:Xstar y:2.5]];
            Xstar += lablelWidth + 15;
            
        }
    }
    
    
    
}

- (NSAttributedString *)attribuedStrring:(NSString *)strring Range:(NSRange)range font:(UIFont *)font {

    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:strring];
    
    [AttributedStr addAttribute:NSFontAttributeName
     
                          value:font
     
                          range:range];

    
    return AttributedStr;
}

- (void)headImgview {
    if (self.filterResultBlock) {
        self.filterResultBlock();
    }
    
}
        
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
