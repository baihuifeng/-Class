//
//  SpecialityCell.h
//  Student
//
//  Created by 葬花桥 on 2017/3/23.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZDetailModel.h"

@interface SpecialityCell : UITableViewCell

@property (nonatomic,strong) LZDetailModel *model;
@property (strong, nonatomic) IBOutlet UILabel *characteristics;

@end
