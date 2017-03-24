//
//  LZTeacherDetailViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZTeacherDetailViewController.h"
#import "LZDetailCell.h"
#import "LZDetailCellManager.h"
#import "LZDetailStandardView.h"

@interface LZTeacherDetailViewController ()

@property (nonatomic,strong) NSArray *caseIndexArr;

@end

@implementation LZTeacherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _caseIndexArr = @[@"1000",@"1001",@"1003"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _caseIndexArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [LZDetailCellManager tableView:tableView heightForRowAtIndexPath:indexPath CellCaseIndex:[_caseIndexArr[indexPath.row] intValue]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    LZDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZDetailCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LZDetailCell" owner:self options:nil] lastObject];
    }
    cell.caseIndex = [_caseIndexArr[indexPath.row] intValue];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
