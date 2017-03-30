//
//  LZDetailcommentCell.h
//  Student
//
//  Created by bai on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZDetailModel.h"

@interface LZDetailcommentCell : UITableViewCell <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *commentTable;

@property (assign,nonatomic) int caseIndex;
@property (nonatomic,strong) LZDetailModel *model;

- (void)setCaseIndex:(int)caseIndex detailModel:(LZDetailModel *)model;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *headContent;

@property (weak, nonatomic) IBOutlet UIButton *headCount;

///回调
@property (nonatomic, copy) void (^filterResultBlock)();
@end
