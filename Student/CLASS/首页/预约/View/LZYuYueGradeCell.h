//
//  LZYuYueGradeCell.h
//  Student
//
//  Created by 白慧峰 on 2017/4/18.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZDetailModel.h"

@interface LZYuYueGradeCell : UITableViewCell

@property (nonatomic,strong) NSArray *dataArr;

@property (nonatomic,strong) NSArray *buttonArr;

@property (nonatomic,assign) int index;

+ (CGFloat)gradeNameArr:(NSArray *)dataArr;

- (void)setDataArr:(NSArray *)dataArr index:(int)indexSelect;

@property (nonatomic,strong) PriceModel *priceModel;

@property (nonatomic,strong) NSArray *priceBtnArr;

@property (assign,nonatomic) int indexPrice;
- (void)setPriceModel:(PriceModel *)priceModel index:(int)priceIndex;

//选择年级
@property (nonatomic, copy) void (^filterResultBlock) (int count);

@end
