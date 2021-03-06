//
//  LZDetailCell.h
//  Student
//
//  Created by 葬花桥 on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZDetailModel.h"

@interface LZDetailCell : UITableViewCell <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *caseIndexArr;
@property (strong, nonatomic) IBOutlet UITableView *DetailtableView;

@property (assign,nonatomic) int caseIndex;

- (void)setCaseIndex:(int)caseIndex detailModel:(LZDetailModel *)model;

@property (nonatomic,strong) LZDetailModel *model;

@end
