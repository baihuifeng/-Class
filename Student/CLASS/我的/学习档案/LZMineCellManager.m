//
//  LZMineCellManager.m
//  Student
//
//  Created by bai on 2017/3/27.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZMineCellManager.h"
#import "LZDABackCellCell.h"
#import "LZDAContentCell.h"

@implementation LZMineCellManager
+ (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath caseIndex:(int)caseIndex {
    
    switch (caseIndex) {
        case 2000:
        {
            LZDABackCellCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZDABackCellCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"LZDABackCellCell" owner:self options:nil] lastObject];
            }
            
            return cell;
        }
        break;
        case 2001:
        {
            LZDAContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZDAContentCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"LZDAContentCell" owner:self options:nil] lastObject];
            }
            
            return cell;
        }
        break;
        
        default:
        return nil;
        break;
    }


}

+ (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath caseIndex:(int)caseIndex {
    switch (caseIndex) {
        case 2000:
        {

            
            return 4*54+40;
        }
        break;
        case 2001:
        {
            
            
            return 54;
        }
        break;
        
        default:
        return 0;
        break;
    }

}


@end
