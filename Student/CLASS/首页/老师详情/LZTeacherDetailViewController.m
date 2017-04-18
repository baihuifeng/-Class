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
#import "LZDetailModel.h"
#import "LZYuYueViewController.h"

@interface LZTeacherDetailViewController ()

@property (nonatomic,strong) NSMutableArray *caseIndexArr;

@property (nonatomic,strong) LZDetailModel *model;

@end

@implementation LZTeacherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    _caseIndexArr = @[@"1000",@"1001",@"1003",@"1008"];
    _caseIndexArr = [[NSMutableArray alloc] init];
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    [NSString stringWithFormat:@"%@Api/getProviderInfo?userId=%@",ManagerUrl,@""];
    [NetApiManager getFromURL:[NSString stringWithFormat:@"%@%@",LZDedailUrl,@"1"] params:nil finished:^(NetResponse *netResponse) {
        [_caseIndexArr addObject:@"1000"];
        NSLog(@"%@",[netResponse.responseObject objectForKey:@"data"]);
        _model = [LZDetailModel mj_objectWithKeyValues:[netResponse.responseObject objectForKey:@"data"]];
        
        if (![_model.studensCount isEqualToString:@"0"]) {
            [_caseIndexArr addObject:@"1001"];
        }
        [_caseIndexArr addObject:@"1003"];
        [_caseIndexArr addObject:@"1008"];
        
        [_DetailtableView reloadData];
        
    }];
    
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"File"ofType:@"json"];
//    
//    //根据文件路径读取数据
//    NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];
//    
//    
//    //格式化成json数据
//    NSMutableDictionary *dic= [NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingAllowFragments error:nil];
//    
////    NSLog(@"-----%@",dic);
//    
//    _model = [LZDetailModel mj_objectWithKeyValues:dic];
//    
//    NSLog(@"%@",_model);
//    
//    [_DetailtableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _caseIndexArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [LZDetailCellManager tableView:tableView heightForRowAtIndexPath:indexPath CellCaseIndex:[_caseIndexArr[indexPath.section] intValue] detailModel:_model];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    LZDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZDetailCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LZDetailCell" owner:self options:nil] lastObject];
    }
//    cell.caseIndex = [_caseIndexArr[indexPath.row] intValue];
    [cell setCaseIndex:[_caseIndexArr[indexPath.section] intValue] detailModel:_model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return 10;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    
}

- (IBAction)backBtn:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)yuyue:(UIButton *)sender {
    LZYuYueViewController *yuyueVC = [[LZYuYueViewController alloc] init];
    yuyueVC.dataArr = _model.price;
    [self.navigationController pushViewController:yuyueVC animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
