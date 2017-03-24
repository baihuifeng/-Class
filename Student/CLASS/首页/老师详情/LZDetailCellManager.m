//
//  LZDetailCellManager.m
//  Student
//
//  Created by 葬花桥 on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZDetailCellManager.h"
#import "LZHeadCell.h"
#import "LZDetailcommentCell.h"
#import "CommentCell.h"
#import "SpecialityCell.h"
#import "TeacherCaseCell.h"

@implementation LZDetailCellManager

// 1000:详情第一个cell  1001：详情第二个cell  1002：详情第二个cell里的cell

+ (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath CellCaseIndex:(int)caseIndex detailModel:(LZDetailModel *)model{
    
    switch (caseIndex) {
        case 1000:
        {
            LZHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZHeadCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"LZHeadCell" owner:self options:nil] lastObject];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.model = model;
            return cell;
        }
            break;
        case 1001:
        {
            LZDetailcommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZDetailcommentCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"LZDetailcommentCell" owner:self options:nil] lastObject];
            }

            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            [cell setCaseIndex:1001 detailModel:model];
            return cell;
        }
            break;
        case 1002:
        {
            CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"CommentCell" owner:self options:nil] lastObject];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.model = model;
            return cell;
        }
            break;
        case 1003:
        {
            LZDetailcommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZDetailcommentCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"LZDetailcommentCell" owner:self options:nil] lastObject];
            }
//            cell.caseIndex = 1003;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setCaseIndex:1003 detailModel:model];
            return cell;
        }
            break;
        case 1004: //
        {
            SpecialityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpecialityCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"SpecialityCell" owner:self options:nil] lastObject];
            }
            cell.model = model;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 1005: //
        {
            TeacherCaseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeacherCaseCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"TeacherCaseCell" owner:self options:nil] lastObject];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
            
        default:
            return nil;
            break;
    }
    
}

+ (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath CellCaseIndex:(int)caseIndex detailModel:(LZDetailModel *)model{
    
    switch (caseIndex) {
        case 1000:
        {

            return 235;
        }
            break;
        case 1001:
        {
            
            return [LZDetailCellManager sizeCommentHeightDetailModel:model];
        }
            break;
        case 1002:
        {
            
            return [LZDetailCellManager sizeCommentHeightDetailModel:model];
        }
            break;
        case 1003:
        {
            
            return 235;
        }
            break;
        case 1004:
        {
            
            return [LZDetailCellManager sizeCharacteristicsHeightDetailModel:model];
        }
            break;
        case 1005:
        {
            
            return 60;
        }
            break;
            
        default:
            return 0;
            break;
    }
    

}

#pragma -mark "评论的高度"

+ (CGFloat)sizeCommentHeightDetailModel:(LZDetailModel *)model {
    
    
    return 100+[LZDetailCellManager sizeStudentCommentHeightDetailModel:model]+[LZDetailCellManager sizeTeacherCommentHeightDetailModel:model];

}
+ (CGFloat)sizeStudentCommentHeightDetailModel:(LZDetailModel *)model {

    return [NSString stringSizeWithString:model.lastComments.comment maxSize:CGSizeMake(kScreen_Width-47, CGFLOAT_MAX) wordFont:14].height;
}

+ (CGFloat)sizeTeacherCommentHeightDetailModel:(LZDetailModel *)model {
    
    return [NSString stringSizeWithString:model.lastComments.feedback maxSize:CGSizeMake(kScreen_Width-55, CGFLOAT_MAX) wordFont:14].height;
}
#pragma -mark "自我介绍的高度"
+ (CGFloat)sizeCharacteristicsHeightDetailModel:(LZDetailModel *)model {
    return [NSString stringSizeWithString:model.characteristics maxSize:CGSizeMake(kScreen_Width-55, CGFLOAT_MAX) wordFont:14].height + 26;
}




@end
