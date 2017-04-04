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


+ (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section detailModel:(LZDetailModel *)model;
+ (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section detailModel:(LZDetailModel *)model;


#pragma -mark "评论的高度"
+ (CGFloat)sizeCommentHeightDetailModel:(LZDetailModel *)model;
+ (CGFloat)sizeStudentCommentHeightDetailModel:(LZDetailModel *)model; //计算学生评论内容的高度
+ (CGFloat)sizeTeacherCommentHeightDetailModel:(LZDetailModel *)model; //计算学生评论内容的高度

#pragma -mark "自我介绍的高度"
+ (CGFloat)sizeCharacteristicsHeightDetailModel:(LZDetailModel *)model;
+ (CGFloat)sizeCharacteristicsCellHeightDetailModel:(LZDetailModel *)model;

#pragma -mark "成功案例"
+ (CGFloat)sizeSuccessfulCaseCaseInfosDetailmodel:(LZDetailModel *)model IndexPath:(NSIndexPath *)indexPath;
+ (CGFloat)sizeSuccessfulCaseCaseInfosDetailmodel:(LZDetailModel *)model;


#pragma -mark "教育经历"
+ (CGFloat)sizeEducationExperiencesDetailmodel:(LZDetailModel *)model IndexPath:(NSIndexPath *)indexPath;
+ (CGFloat)sizeEducationExperiencesDetailmodel:(LZDetailModel *)model;

#pragma -mark "毕业学校"
+ (CGFloat)sizeCollegeDetailmodel:(LZDetailModel *)model;

#pragma -mark "授课信息"

+ (CGFloat)sizeGradesWithRegionDetailmodel:(LZDetailModel *)model IndexPath:(NSIndexPath *)indexPath;
+ (CGFloat)sizeGradesWithRegionDetailmodel:(LZDetailModel *)model;

@end
