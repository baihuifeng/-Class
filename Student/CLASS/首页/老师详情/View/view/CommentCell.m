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
    _customGrade.text = model.lastComments.customNickName;
    _commentsTime.text = model.lastComments.commentsTime;
    _learnTime.text = [NSString stringWithFormat:@"%@课时",model.lastComments.learnTime];
    _comment.text = model.lastComments.comment;
    _feedback.text = model.lastComments.feedback;
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
