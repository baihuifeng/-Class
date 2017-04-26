//
//  LZYuYueViewController.h
//  Student
//
//  Created by 白慧峰 on 2017/4/18.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"
#import "LZYuYueTimeCell.h"

@interface LZYuYueViewController : LZRootViewController

@property (nonatomic,strong) PriceModel *PriceModel;

@property (nonatomic,strong) NSArray *grades;

@property (nonatomic,strong) NSArray *skillsArr;

@property (nonatomic,strong) LZDetailModel *detailModel;

@property (strong, nonatomic) IBOutlet UITableView *yuyueTableView;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;



@end
