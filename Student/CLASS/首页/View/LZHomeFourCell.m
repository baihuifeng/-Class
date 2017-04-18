//
//  LZHomeFourCell.m
//  Student
//
//  Created by bai on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZHomeFourCell.h"
#import "LZTeacherListCell.h"


@implementation LZHomeFourCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    
}

- (void)setDataArr:(NSArray *)dataArr {
    _dataArr = dataArr;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView reloadData];
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 105;  //570
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    LZTeacherListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZTeacherListCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LZTeacherListCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = _dataArr[indexPath.row];
    return cell;
       
}
- (IBAction)moreClassBtn:(UIButton *)sender {
    
    [LZJumpNextViewController presentNextViewController:3 Url:@"" title:@""];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
