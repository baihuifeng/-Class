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
    _commentTable.delegate = self;
    _commentTable.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [LZDetailCellManager tableView:tableView heightForRowAtIndexPath:indexPath CellCaseIndex:1002];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [LZDetailCellManager tableView:tableView cellForRowAtIndexPath:indexPath CellCaseIndex:1002];
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
