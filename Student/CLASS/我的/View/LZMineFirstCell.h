//
//  LZMineFirstCell.h
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LZMineFirstCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (strong, nonatomic) IBOutlet UIImageView *backHeadImg;

@property (strong, nonatomic) IBOutlet UIView *backView;

@property (nonatomic,strong) JYAccount *model;
@end
