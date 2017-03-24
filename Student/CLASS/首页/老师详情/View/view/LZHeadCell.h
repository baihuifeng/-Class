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
@property (strong, nonatomic) IBOutlet UILabel *nickName;
@property (strong, nonatomic) IBOutlet UILabel *priceDescribe;

@property (strong ,nonatomic) LZDetailModel *model;

@end
