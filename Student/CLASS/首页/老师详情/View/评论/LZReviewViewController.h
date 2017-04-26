//
//  LZReviewViewController.h
//  Student
//
//  Created by bai on 2017/3/27.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"
#import "LZDetailModel.h"

@interface LZReviewViewController : LZRootViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) LZDetailModel *model;

@end
