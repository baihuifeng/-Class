//
//  LZDetailCell.m
//  Student
//
//  Created by 葬花桥 on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZDetailCell.h"
#import "LZDetailCellManager.h"

@implementation LZDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCaseIndexArr:(NSArray *)caseIndexArr {
    _caseIndexArr = caseIndexArr;
    _DetailtableView.delegate = self;
    _DetailtableView.dataSource = self;
    
}

- (void)setCaseIndex:(int)caseIndex {
    _caseIndex = caseIndex;
    _DetailtableView.delegate = self;
    _DetailtableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [LZDetailCellManager tableView:tableView heightForRowAtIndexPath:indexPath CellCaseIndex:_caseIndex];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [LZDetailCellManager tableView:tableView cellForRowAtIndexPath:indexPath CellCaseIndex:_caseIndex];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
