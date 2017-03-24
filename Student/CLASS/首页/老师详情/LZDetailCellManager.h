//
//  LZDetailCellManager.h
//  Student
//
//  Created by 葬花桥 on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZDetailModel.h"


@interface LZDetailCellManager : NSObject

+ (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath CellCaseIndex:(int)caseIndex detailModel:(LZDetailModel *)model;


+ (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath CellCaseIndex:(int)caseIndex detailModel:(LZDetailModel *)model;

@end
