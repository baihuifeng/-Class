//
//  LZDetailCellManager.m
//  Student
//
//  Created by 葬花桥 on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZDetailCellManager.h"
#import "LZHeadCell.h"

@implementation LZDetailCellManager


+ (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath CellCaseIndex:(int)caseIndex {
    
    switch (caseIndex) {
        case 1000:
        {
            LZHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZHeadCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"LZHeadCell" owner:self options:nil] lastObject];
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

+ (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath CellCaseIndex:(int)caseIndex {
    
    switch (caseIndex) {
        case 1000:
        {

            return 235;
        }
            break;
            
        default:
            return 0;
            break;
    }
    

}

@end
