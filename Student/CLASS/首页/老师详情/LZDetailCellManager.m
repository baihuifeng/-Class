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
#import "LZExperienceInfosCell.h"
#import "LZGradesWithRegionTableViewCell.h"
#import "LZReviewViewController.h"


#define NH_tagHeight1 25
#define NH_tagHSpace1 10
#define NH_tagWSpace1 5
#define NH_tagFont [UIFont systemFontOfSize:12]

@implementation LZDetailCellManager

// 1000:详情第一个cell  1001：详情第二个cell  1002：详情第二个cell里的cell
// 1000:详情第一个cell  1004：教学特点  1005：成功案例 1006:教育经历

+ (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath CellCaseIndex:(int)caseIndex detailModel:(LZDetailModel *)model{
    HHTabbarViewController *tabar = (HHTabbarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    switch (caseIndex) {
        case 1000:
        {
            LZHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZHeadCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"LZHeadCell" owner:self options:nil] lastObject];
            }
            cell.filterResultBlock = ^() {
            
                NSLog(@"相册");
                
            };
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
            cell.filterResultBlock = ^() {

                LZReviewViewController *reviewVC = [[LZReviewViewController alloc] init];
                reviewVC.model = model;
            [(UINavigationController *)tabar.selectedViewController pushViewController:reviewVC animated:YES];
                
            };

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
            cell.model = model.successfulCase.caseInfos[indexPath.row];
            
            if (model.successfulCase.caseInfos.count != 0) {
                if (indexPath.row + 1 == model.successfulCase.caseInfos.count) {
                    cell.lineBackView.hidden = YES;
                } else {
                    cell.lineBackView.hidden = NO;
                }
            }
            
            return cell;
        }
            break; //
        case 1006: //
        {
            LZExperienceInfosCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZExperienceInfosCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"LZExperienceInfosCell" owner:self options:nil] lastObject];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.topView.hidden = indexPath.row == 0 ? YES :NO;
            if (model.educationExperiences.experienceInfos.count != 0) {
                cell.buttomView.hidden = indexPath.row + 1 == model.educationExperiences.experienceInfos.count ? YES : NO;
            }

            cell.model = model.educationExperiences.experienceInfos[indexPath.row];
            if (model.educationExperiences.experienceInfos != 0) {
                if (indexPath.row + 1 == model.educationExperiences.experienceInfos.count) {
                    cell.lineBackView.hidden = YES;
                } else {
                    cell.lineBackView.hidden = NO;
                }
            }
            return cell;
        }
            break;
        case 1007: //
        {
            SpecialityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpecialityCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"SpecialityCell" owner:self options:nil] lastObject];
            }
//            cell.model = model;
            [cell setModel:model caseIndex:1007];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 1008: //
        {
            LZDetailcommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZDetailcommentCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"LZDetailcommentCell" owner:self options:nil] lastObject];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [cell setCaseIndex:1008 detailModel:model];
            return cell;
        }
            break;
        case 1009: //
        {
            LZGradesWithRegionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZGradesWithRegionTableViewCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"LZGradesWithRegionTableViewCell" owner:self options:nil] lastObject];
            }
            
            if (model.grades.count == 0) {
                if (model.region.count != 0) {
                    cell.title.text = @"授课区域";
                    cell.comment.text = [model.region componentsJoinedByString:@","];
                }
            } else {
                if (model.region.count != 0) {
                    cell.title.text = indexPath.section == 0 ? @"科目年级" : @"授课区域";
                    NSMutableArray *titleArr = [[NSMutableArray alloc] init];
                    
                    for (GradesModel *Gradesmodel in model.grades) {
                        [titleArr addObject:Gradesmodel.gradeName];
                    }
                    
                    cell.comment.text = indexPath.section == 0 ? [[titleArr componentsJoinedByString:@","] stringByReplacingOccurrencesOfString:@"," withString:@" "]: [[model.region componentsJoinedByString:@","] stringByReplacingOccurrencesOfString:@"," withString:@" "];
                    
                }
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
            
            return [LZDetailCellManager sizeCommentHeightDetailModel:model] + [LZDetailCellManager tableView:tableView heightForHeaderInSection:indexPath.section detailModel:model];
        }
            break;
        case 1002:
        {
            
            return [LZDetailCellManager sizeCommentHeightDetailModel:model] + [LZDetailCellManager tableView:tableView heightForHeaderInSection:indexPath.section detailModel:model];
        }
            break;
        case 1003:
        { //
            
            return  [LZDetailCellManager sizeCharacteristicsCellHeightDetailModel:model] + [LZDetailCellManager sizeSuccessfulCaseCaseInfosDetailmodel:model] +[LZDetailCellManager sizeEducationExperiencesDetailmodel:model] +[LZDetailCellManager sizeCollegeDetailmodelCellHeight:model];
        }
            break;
        case 1004:
        {
            
            return [LZDetailCellManager sizeCharacteristicsHeightDetailModel:model];
        }
            break;
        case 1005:
        {
            
            return [LZDetailCellManager sizeSuccessfulCaseCaseInfosDetailmodel:model IndexPath:indexPath];
        }
            break;
        case 1006:
        {
            
            return [LZDetailCellManager sizeEducationExperiencesDetailmodel:model IndexPath:indexPath];
        }
            break;
        case 1007:
        {
            
            return [LZDetailCellManager sizeCollegeDetailmodel:model];
        }
            break;
        case 1008:
        {
            
            return [LZDetailCellManager sizeGradesWithRegionDetailmodel:model];
        }
            break;
        case 1009:
        {
            
            return [LZDetailCellManager sizeGradesWithRegionDetailmodel:model IndexPath:indexPath];
        }
            break;
            
        default:
            return 0;
            break;
    }
    

}
#pragma -mark "评论头部的高度"

+ (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section detailModel:(LZDetailModel *)model {
    
    if (model.commentTags.count != 0) {
        UIView *view = [[UIView alloc] init];
            //tag标签初始化
            int startX = 12;
            int startY = 0;
            int limitX =  kScreen_Width- 24;
            
            for (int i = 0; i<model.commentTags.count; i++) {
                CommentTagsModel *tagsText = [model.commentTags objectAtIndex:i];
                CGFloat yqWidth = [LZDetailCellManager getTagLabelWidth:[NSString stringWithFormat:@"%@%@",tagsText.tagName,tagsText.supportCount]];
                
                if ((startX + yqWidth) > limitX) {
                    startY += NH_tagHeight1+NH_tagHSpace1;
                    startX =12;
                }
                [view addSubview:[LZDetailCellManager getTag:[NSString stringWithFormat:@"%@%@",tagsText.tagName,tagsText.supportCount] x:startX y:startY w:yqWidth tag:i titleColor:UICOLOR_RGB_Alpha(0xF5A623, 1.0) backColor:UICOLOR_RGB_Alpha(0xF5EFE9, 1.0)]];
                startX += yqWidth + NH_tagWSpace1;
            }
        view.frame = CGRectMake(0, 0, kScreen_Width, startY +NH_tagHSpace1+ NH_tagHeight1);
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height-0.5, kScreen_Width, 0.5)];
        line.backgroundColor = UICOLOR_RGB_Alpha(0xdbdbdb, 1.0);
        [view addSubview:line];
        
        
        return view;
        }
    
    return nil;
    
}

+ (UIButton *)getTag:(NSString *)tagString x:(CGFloat)x y:(CGFloat)y w:(CGFloat)w tag:(int)tag titleColor:(UIColor *)color backColor:(UIColor *)backColor{
    //
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(x, y, w, 25);
    [btn setTitle:tagString forState:UIControlStateNormal];
    btn.tag = tag+10;
    
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setBackgroundColor:backColor];
    NSLog(@"========%@",btn.titleLabel.text);
    btn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    btn.layer.cornerRadius = 12.5;
    btn.layer.borderWidth = 0.5;
    btn.layer.borderColor = UICOLOR_RGB_Alpha(0xF5A263, 1.0).CGColor;
    return btn;
    
}


+(CGFloat)getTagLabelWidth:(NSString *)string{
    NSMutableParagraphStyle *pStyle = [[NSMutableParagraphStyle alloc]init];
    [pStyle setLineBreakMode:NSLineBreakByCharWrapping];
    pStyle.lineSpacing = 0;
    
    CGRect matchRect = [string boundingRectWithSize:CGSizeMake(kScreen_Width - 16, 16) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:NH_tagFont,NSFontAttributeName,pStyle,NSParagraphStyleAttributeName, nil] context:nil];
    
    return matchRect.size.width + 20;
    
}
+ (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section detailModel:(LZDetailModel *)model {
    if (model.commentTags.count != 0) {
        //tag标签初始化
        int startX = 12;
        int startY = 0;
        int limitX =  kScreen_Width- 24;
        
        for (int i = 0; i<model.commentTags.count; i++) {
            CommentTagsModel *tagsText = [model.commentTags objectAtIndex:i];
            CGFloat yqWidth = [LZDetailCellManager getTagLabelWidth:[NSString stringWithFormat:@"%@%@",tagsText.tagName,tagsText.supportCount]];
            
            if ((startX + yqWidth) > limitX) {
                startY += NH_tagHeight1+NH_tagHSpace1;
                startX =12;
            }
            startX += yqWidth + NH_tagWSpace1;
        }
        
        return startY +NH_tagHSpace1+ NH_tagHeight1;
    }

    return 0;
}



#pragma -mark "评论的高度"

+ (CGFloat)sizeCommentHeightDetailModel:(LZDetailModel *)model {
    
    
    return 110+[LZDetailCellManager sizeStudentCommentHeightDetailModel:model]+[LZDetailCellManager sizeTeacherCommentHeightDetailModel:model];

}
+ (CGFloat)sizeStudentCommentHeightDetailModel:(LZDetailModel *)model {

    return [NSString stringSizeWithString:model.lastComments.comment maxSize:CGSizeMake(kScreen_Width-47, CGFLOAT_MAX) wordFont:14].height;
}

+ (CGFloat)sizeTeacherCommentHeightDetailModel:(LZDetailModel *)model {
    
    return [NSString stringSizeWithString:[NSString stringWithFormat:@"老师回复：%@",model.lastComments.feedback] maxSize:CGSizeMake(kScreen_Width-55, CGFLOAT_MAX) wordFont:14].height+15;
}
#pragma -mark "自我介绍的高度"
+ (CGFloat)sizeCharacteristicsHeightDetailModel:(LZDetailModel *)model {
    return [NSString stringSizeWithString:model.characteristics maxSize:CGSizeMake(kScreen_Width-30, CGFLOAT_MAX) wordFont:14].height + 50;
}

+ (CGFloat)sizeCharacteristicsCellHeightDetailModel:(LZDetailModel *)model {
    return [NSString stringSizeWithString:model.characteristics maxSize:CGSizeMake(kScreen_Width-30, CGFLOAT_MAX) wordFont:14].height + 80;
}
#pragma -mark "成功案例"
+ (CGFloat)sizeSuccessfulCaseCaseInfosDetailmodel:(LZDetailModel *)model IndexPath:(NSIndexPath *)indexPath{
    ContentModel *contentModel = model.successfulCase.caseInfos[indexPath.row];
    return [NSString stringSizeWithString:contentModel.content maxSize:CGSizeMake(kScreen_Width-30, CGFLOAT_MAX) wordFont:12].height + 45;
}

+ (CGFloat)sizeSuccessfulCaseCaseInfosDetailmodel:(LZDetailModel *)model {
    
    float f = 0;
    
    for (int i = 0; i<model.successfulCase.caseInfos.count; i++) {
     
        ContentModel *contentModel = model.successfulCase.caseInfos[i];
        f += [NSString stringSizeWithString:contentModel.content maxSize:CGSizeMake(kScreen_Width-30, CGFLOAT_MAX) wordFont:12].height + 45;
        
    }
    
    return f+40;
    
}

#pragma -mark "教育经历"

+ (CGFloat)sizeEducationExperiencesDetailmodel:(LZDetailModel *)model IndexPath:(NSIndexPath *)indexPath {
    ContentModel *contentModel = model.educationExperiences.experienceInfos[indexPath.row];
    return [NSString stringSizeWithString:contentModel.content maxSize:CGSizeMake(kScreen_Width-50, CGFLOAT_MAX) wordFont:12].height + 80;

}

+ (CGFloat)sizeEducationExperiencesDetailmodel:(LZDetailModel *)model {
    
    float f = 0;
    
    for (int i = 0; i<model.educationExperiences.experienceInfos.count; i++) {
        
        ContentModel *contentModel = model.educationExperiences.experienceInfos[i];
        f += [NSString stringSizeWithString:contentModel.content maxSize:CGSizeMake(kScreen_Width-60, CGFLOAT_MAX) wordFont:12].height+80;
        
    }
    
    return f;

}


#pragma -mark "毕业学校"
+ (CGFloat)sizeCollegeDetailmodel:(LZDetailModel *)model{
    return [NSString stringSizeWithString:model.college maxSize:CGSizeMake(kScreen_Width-55, CGFLOAT_MAX) wordFont:14].height + 26;
}
+ (CGFloat)sizeCollegeDetailmodelCellHeight:(LZDetailModel *)model{
    return [NSString stringSizeWithString:model.college maxSize:CGSizeMake(kScreen_Width-55, CGFLOAT_MAX) wordFont:14].height + 26+40;
}
#pragma -mark "授课信息"

+ (CGFloat)sizeGradesWithRegionDetailmodel:(LZDetailModel *)model IndexPath:(NSIndexPath *)indexPath {
    
    if (model.region.count == 0 && model.grades.count == 0) {
        return 0;
    } else if (model.region.count != 0 && model.grades.count == 0) {
        NSString *str = [[model.region componentsJoinedByString:@","] stringByReplacingOccurrencesOfString:@"," withString:@" "];
        return [NSString stringSizeWithString:str maxSize:CGSizeMake(kScreen_Width-55, CGFLOAT_MAX) wordFont:14].height + 24;
    } else if (model.region.count == 0 && model.grades.count !=0 ) {
        NSMutableArray *titleArr = [[NSMutableArray alloc] init];
        
        for (GradesModel *Gradesmodel in model.grades) {
            [titleArr addObject:Gradesmodel.gradeName];
        }
        NSString *str = [[titleArr componentsJoinedByString:@","] stringByReplacingOccurrencesOfString:@"," withString:@" "];
        return [NSString stringSizeWithString:str maxSize:CGSizeMake(kScreen_Width-55, CGFLOAT_MAX) wordFont:14].height + 24;
    } else {
        NSMutableArray *titleArr = [[NSMutableArray alloc] init];
        
        for (GradesModel *Gradesmodel in model.grades) {
            [titleArr addObject:Gradesmodel.gradeName];
        }
        NSString *regionStr = [[model.region componentsJoinedByString:@","] stringByReplacingOccurrencesOfString:@"," withString:@" "];
        
        NSString *gradesStr = [[titleArr componentsJoinedByString:@","] stringByReplacingOccurrencesOfString:@"," withString:@" "];
        
        if (indexPath.section == 0) {
            return [NSString stringSizeWithString:gradesStr maxSize:CGSizeMake(kScreen_Width-110, CGFLOAT_MAX) wordFont:14].height + 28;
        } else {
            return [NSString stringSizeWithString:regionStr maxSize:CGSizeMake(kScreen_Width-110, CGFLOAT_MAX) wordFont:14].height + 28;
        }
    }

}

+ (CGFloat)sizeGradesWithRegionDetailmodel:(LZDetailModel *)model {
    if (model.region.count == 0 && model.grades.count == 0) {
        return 0;
    } else if (model.region.count != 0 && model.grades.count == 0) {
        NSString *str = [[model.region componentsJoinedByString:@","] stringByReplacingOccurrencesOfString:@"," withString:@" "];
        return [NSString stringSizeWithString:str maxSize:CGSizeMake(kScreen_Width-55, CGFLOAT_MAX) wordFont:14].height + 65;
    } else if (model.region.count == 0 && model.grades.count !=0 ) {
        NSMutableArray *titleArr = [[NSMutableArray alloc] init];
        
        for (GradesModel *Gradesmodel in model.grades) {
            [titleArr addObject:Gradesmodel.gradeName];
        }
        NSString *str = [[titleArr componentsJoinedByString:@","] stringByReplacingOccurrencesOfString:@"," withString:@" "];
        return [NSString stringSizeWithString:str maxSize:CGSizeMake(kScreen_Width-55, CGFLOAT_MAX) wordFont:14].height + 65;
    } else {
        NSString *regionStr = [[model.region componentsJoinedByString:@","] stringByReplacingOccurrencesOfString:@"," withString:@" "];
        NSMutableArray *titleArr = [[NSMutableArray alloc] init];
        
        for (GradesModel *Gradesmodel in model.grades) {
            [titleArr addObject:Gradesmodel.gradeName];
        }
        NSString *gradesStr = [[titleArr componentsJoinedByString:@","] stringByReplacingOccurrencesOfString:@"," withString:@" "];


            return [NSString stringSizeWithString:regionStr maxSize:CGSizeMake(kScreen_Width-110, CGFLOAT_MAX) wordFont:14].height + 28 +[NSString stringSizeWithString:gradesStr maxSize:CGSizeMake(kScreen_Width-110, CGFLOAT_MAX) wordFont:14].height + 28+50;
    }
}


@end
