//
//  LZDetailcommentCell.m
//  Student
//
//  Created by bai on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZDetailcommentCell.h"

@implementation LZDetailcommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}


- (void)setCaseIndex:(int)caseIndex detailModel:(LZDetailModel *)model {
    _caseIndex = caseIndex;
    _model = model;
    _commentTable.delegate = self;
    _commentTable.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_caseIndex == 1001) {
        return 1;
    } else {
        if (section == 0) {
            return 1;
        } else {
            return 2;
        }
        
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    if (_caseIndex == 1001) {
        return 1;
    } else {
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_caseIndex == 1001) {
        return [LZDetailCellManager tableView:tableView heightForRowAtIndexPath:indexPath CellCaseIndex:1002 detailModel:_model];
    } else {
        if (indexPath.section == 0) {
            return [LZDetailCellManager tableView:tableView heightForRowAtIndexPath:indexPath CellCaseIndex:1004 detailModel:_model];
        } else {
            return [LZDetailCellManager tableView:tableView heightForRowAtIndexPath:indexPath CellCaseIndex:1005 detailModel:_model];
        }
        
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_caseIndex == 1001) {
        return [LZDetailCellManager tableView:tableView cellForRowAtIndexPath:indexPath CellCaseIndex:1002 detailModel:_model];
    } else {
        if (indexPath.section == 0) {
            return [LZDetailCellManager tableView:tableView cellForRowAtIndexPath:indexPath CellCaseIndex:1004 detailModel:_model];
        } else {
            return [LZDetailCellManager tableView:tableView cellForRowAtIndexPath:indexPath CellCaseIndex:1005 detailModel:_model];
        }
        
    }

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
