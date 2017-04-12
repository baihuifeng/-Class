//
//  LZDABackCellCell.m
//  Student
//
//  Created by bai on 2017/3/27.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZDABackCellCell.h"
#import "LZMineCellManager.h"

@implementation LZDABackCellCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [LZMineCellManager tableView:tableView heightForRowAtIndexPath:indexPath caseIndex:2001];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [LZMineCellManager tableView:tableView cellForRowAtIndexPath:indexPath caseIndex:2001];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
