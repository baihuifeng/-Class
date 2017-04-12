//
//  LZCourseFirstCell.h
//  Student
//
//  Created by bai on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZCourseModel.h"

@interface LZCourseFirstCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *teacherHeadImgUrl;
@property (weak, nonatomic) IBOutlet UILabel *teacherName;
@property (weak, nonatomic) IBOutlet UILabel *teacherId;
@property (weak, nonatomic) IBOutlet UILabel *teachSkill;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *unit;
@property (weak, nonatomic) IBOutlet UILabel *price;

@property (nonatomic,strong) LZCourseModel *model;
@property (weak, nonatomic) IBOutlet UIButton *stateBtn;

+ (CGFloat)tabViewCellHeight:(LZCourseModel *)model;

- (void)setModel:(LZCourseModel *)model index:(NSInteger)index;

@end
