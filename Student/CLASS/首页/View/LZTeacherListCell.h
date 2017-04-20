//
//  LZTeacherListCell.h
//  Student
//
//  Created by bai on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZTeacherListModel.h"

@interface LZTeacherListCell : UITableViewCell

@property (nonatomic,strong) ListModel *model;
;
@property (weak, nonatomic) IBOutlet UIImageView *imgUrl;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *priceW;

@property (strong, nonatomic) IBOutlet UIView *tagSView;

@property (strong, nonatomic) IBOutlet UIView *certificationTags;

@property (strong, nonatomic) IBOutlet UIView *distenceView;

@property (weak, nonatomic) IBOutlet UILabel *tagInfo;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *distenceW;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *titleW;

@property (strong, nonatomic) IBOutlet UIImageView *sexImg;



@end
