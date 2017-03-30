//
//  CommentCell.h
//  Student
//
//  Created by bai on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZDetailModel.h"

@interface CommentCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *customImgUrl;
@property (strong, nonatomic) IBOutlet UILabel *customNickName;
@property (strong, nonatomic) IBOutlet UILabel *commentsTime;
@property (strong, nonatomic) IBOutlet UILabel *customGrade;
@property (strong, nonatomic) IBOutlet UILabel *learnTime;
@property (strong, nonatomic) IBOutlet UILabel *comment;
@property (strong, nonatomic) IBOutlet UILabel *feedback;

@property (strong,nonatomic) LZDetailModel *model;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *commentBackViewH;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *commentH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *feedViewH;

@end
