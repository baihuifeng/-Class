//
//  LZDetailStandardView.m
//  Student
//
//  Created by bai on 2017/3/23.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZDetailStandardView.h"
#import "LZStansardCell.h"

@implementation LZDetailStandardView

- (id)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.frame = frame;
        self = [[[NSBundle mainBundle] loadNibNamed:@"LZDetailStandardView" owner:self options:nil] lastObject];
        _standerdTableView.delegate = self;
        _standerdTableView.dataSource = self;
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return kScreen_Width/320*70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LZStansardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZStansardCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LZStansardCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (IBAction)clearBtn:(UIButton *)sender {
    [self removeFromSuperview];
}

@end
