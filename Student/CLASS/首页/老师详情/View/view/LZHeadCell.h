//
//  LZHeadCell.h
//  Student
//
//  Created by 葬花桥 on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZDetailModel.h"



@interface LZHeadCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (strong, nonatomic) IBOutlet UILabel *nickName;
@property (strong, nonatomic) IBOutlet UILabel *priceDescribe;

@property (strong ,nonatomic) LZDetailModel *model;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *studensCount;
@property (weak, nonatomic) IBOutlet UILabel *teachingAge;
@property (weak, nonatomic) IBOutlet UILabel *satisfaction;

@property (weak, nonatomic) IBOutlet UIView *certificationTagsView;

///回调
@property (nonatomic, copy) void (^filterResultBlock) ();

@end
