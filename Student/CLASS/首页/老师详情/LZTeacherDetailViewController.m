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
#import "LZChatViewController.h"

@interface LZTeacherDetailViewController ()

@property (nonatomic,strong) NSMutableArray *caseIndexArr;

@property (nonatomic,strong) LZDetailModel *model;

@property (nonatomic,strong) JYAccount *infoModel;

@end

@implementation LZTeacherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    _caseIndexArr = @[@"1000",@"1001",@"1003",@"1008"];
    _caseIndexArr = [[NSMutableArray alloc] init];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _infoModel = [JYAccountTool account];
    [NetApiManager getFromURL:[NSString stringWithFormat:@"%@userId=%@&teacherId=%@",LZDedailUrl,_infoModel.userId,@"5"] params:nil finished:^(NetResponse *netResponse) {
        [_caseIndexArr addObject:@"1000"];
        NSLog(@"%@",[netResponse.responseObject objectForKey:@"data"]);
        _model = [LZDetailModel mj_objectWithKeyValues:[netResponse.responseObject objectForKey:@"data"]];
        
        if ([_model.isCollection isEqualToString:@"0"]) {
            _isCollection.selected = YES;
        } else {
            _isCollection.selected = NO;
        }
        
        
        if (![_model.commentsCount isEqualToString:@"0"]) {
            [_caseIndexArr addObject:@"1001"];
        }
        [_caseIndexArr addObject:@"1003"];
        [_caseIndexArr addObject:@"1008"];
        
        [_DetailtableView reloadData];
        
    }];
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
    yuyueVC.detailModel = _model;
    [self.navigationController pushViewController:yuyueVC animated:YES];
}

- (IBAction)zixun:(UIButton *)sender {
    LZChatViewController *chatVC = [[LZChatViewController alloc] initWithConversationChatter:_model.imName conversationType:EMConversationTypeChat];
    chatVC.title = _model.imName;
    [self.navigationController pushViewController:chatVC animated:YES];
}

- (IBAction)collection:(UIButton *)sender {
    
    if (!_infoModel.userId) {
        
    } else {
        if (sender.selected == YES) {
            [self isCollection:@"1" userId:_infoModel.userId];
        } else {
            [self isCollection:@"0" userId:_infoModel.userId];
        }
    }

}

- (void)isCollection:(NSString *)tag userId:(NSString *)userId{
    
    [NetApiManager getFromURL:[NSString stringWithFormat:@"%@userId=%@&collectorId=%@&isCollection=%@",LZCollection,userId,_model.userID,tag] params:nil finished:^(NetResponse *netResponse) {
        if (netResponse.isSuccess) {
            if ([tag isEqualToString:@"1"]) {
                SWToast(@"取消关注");
                _isCollection.selected = NO;
            } else {
                SWToast(@"成功关注");
                _isCollection.selected = YES;
            }
        } else {
            SWToast(@"操作失败");
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
