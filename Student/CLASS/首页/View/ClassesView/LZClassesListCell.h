//
//  LZClassesListCell.h
//  Student
//
//  Created by 葬花桥 on 2017/3/21.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZTeacherListModel.h"

@interface LZClassesListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *isExclusive;
@property (weak, nonatomic) IBOutlet UILabel *price;

@property (weak, nonatomic) IBOutlet UIView *pingfenView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pingfenW;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;

@property (nonatomic,strong) ListModel *model;
@end
