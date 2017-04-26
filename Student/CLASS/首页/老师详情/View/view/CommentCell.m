//
//  CommentCell.m
//  Student
//
//  Created by bai on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(LZDetailModel *)model {
    _model = model;
    _customNickName.text = model.lastComments.customNickName;
    
    _commentsTime.text = model.lastComments.commentsTime;
    
    _comment.text = model.lastComments.comment;
//    _feedback.text = model.lastComments.feedback;
    _feedback.attributedText = [self attribuedStrring:[NSString stringWithFormat:@"老师回复：%@",model.lastComments.feedback] Range:NSMakeRange(0, 5) color:UICOLOR_RGB_Alpha(0x23CD77, 1.0)];
    
    _commentH.constant = [LZDetailCellManager sizeStudentCommentHeightDetailModel:model];
    _commentBackViewH.constant = [LZDetailCellManager sizeStudentCommentHeightDetailModel:model]+56;
    _feedViewH.constant = [LZDetailCellManager sizeTeacherCommentHeightDetailModel:model];
    
    NSString *customGradeStr = model.lastComments.customGrade;
    NSString *timeStr = [NSString stringWithFormat:@"%@%@课时",customGradeStr,model.lastComments.learnTime];
    _customGrade.attributedText = [self attribuedStrring:timeStr Range:NSMakeRange(customGradeStr.length, timeStr.length-customGradeStr.length) color:UICOLOR_RGB_Alpha(0x23CD77, 1.0)];

    [self layoutIfNeeded];
    
    
    
}

- (NSAttributedString *)attribuedStrring:(NSString *)strring Range:(NSRange)range color:(UIColor *)color {
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:strring];
    [AttributedStr addAttribute:NSForegroundColorAttributeName
     
                          value:color
     
                          range:range];
    
    
    return AttributedStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
