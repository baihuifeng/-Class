//
//  LZMineYXViewController.m
//  Student
//
//  Created by bai on 2017/3/27.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZMineYXViewController.h"
#import "LZMineYXCell.h"
#import "LZTeacherListModel.h"
#import "LZInfoGradeViewController.h"

@interface LZMineYXViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *dataArr;

@property (nonatomic,copy) NSString *kemu;


@property (strong,nonatomic) LZInfoGradeViewController *gradeVc;

@property (copy,nonatomic) NSString *userId;

@property (assign,nonatomic) int tag;

@property (assign,nonatomic) BOOL iszhuce;
@property (assign,nonatomic) BOOL isEide;


@end

@implementation LZMineYXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"学习意向";
    
    _iszhuce = NO;
    _isEide = NO;
    
    _tableView.tableFooterView = [[UIView alloc] init];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button1 addTarget:self action:@selector(saveInfo:)
      forControlEvents:UIControlEventTouchUpInside];
    button1.frame = CGRectMake(0, 0, 50, 44);
    [button1 setTitle:@"保存" forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:15.0];
    button1.titleLabel.textAlignment = NSTextAlignmentRight;
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *address = [[UIBarButtonItem alloc] initWithCustomView:button1];
    self.navigationItem.rightBarButtonItems = @[address];
    [self dataArrInit];
}

- (void)dataArrInit{
    _dataArr = [[NSMutableArray alloc] init];

    
    [_dataArr addObjectsFromArray:[TagsInfoModel mj_objectArrayWithKeyValuesArray:_model.expectSkills]];
    
    NSMutableArray *titleArr = [[NSMutableArray alloc] init];
    for (TagsInfoModel *modelTag in _dataArr) {
        [titleArr addObject:modelTag.name];
    }
    
    _kemu = [titleArr componentsJoinedByString:@" "];
    [_tableView reloadData];

}

- (void)saveInfo:(UIButton *)sender {
    [Tool showHUDAddedTo:self.view animated:YES];
    
    if (_comeApp == 0) {
        if (_iszhuce == NO) {
            _tag = 0;
            [self userRegister];
        } else {
            _tag = 0;
            if (_isEide == NO) {
                [self editInfo];
            }
            
        }
    
    } else {
        _tag = 1;
        [self editInfo];
    }

    
}

- (void)editInfo {
    
    NSDictionary *parm = _model.mj_keyValues;
    
    NSLog(@"%@",parm);
    
    [NetApiManager postToURL:LZEditInfoUrl bodyParams:parm finished:^(NetResponse *netResponse) {
        
        if (netResponse.isSuccess) {
            _userId = _model.userId;
            [self getUserInfo:1];
        } else {
            SWToast(netResponse.errorMessage);
            _isEide = YES;
            [Tool hideHUDForView:self.view animated:YES];
        }
    }];
    
}

- (void)userRegister {
    
    NSDictionary *parm = _model.mj_keyValues;
    
    [NetApiManager postToURL:LZZhuCe bodyParams:parm finished:^(NetResponse *netResponse) {
        if (netResponse.isSuccess) {
            _iszhuce = YES;
            _userId = netResponse.responseObject[@"data"];
            [self getUserInfo:0];
        } else {
            _iszhuce = NO;
            SWToast(netResponse.errorMessage);

            [Tool hideHUDForView:self.view animated:YES];
        }
    }];
}

- (void)getUserInfo:(int)tag {
    
    [NetApiManager getFromURL:[NSString stringWithFormat:@"%@userId=%@",LZInfoUrl,_userId] params:nil finished:^(NetResponse *netResponse) {
        if (netResponse.isSuccess) {
            JYAccount *infoAccount = [JYAccount mj_objectWithKeyValues:netResponse.responseObject[@"data"]];
            [JYAccountTool save:infoAccount];
            if (tag == 0) {
                SWToast(@"注册成功");
                _isEide = YES;
                HHTabbarViewController *tab = (HHTabbarViewController *)JYRootTabBarController;
                tab.selectedIndex = 0;
                [Tool hideHUDForView:self.view animated:YES];
                [self.navigationController popToRootViewControllerAnimated:YES];

            } else {
                SWToast(@"编辑成功");
                _isEide = YES;
                [self.navigationController popViewControllerAnimated:YES];
                
            }
            
            
        } else {
            _isEide = NO;
            SWToast(netResponse.errorMessage);

            [Tool hideHUDForView:self.view animated:YES];
        }
    }];

}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LZMineYXCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZMineYXCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LZMineYXCell" owner:self options:nil] lastObject];
    }
    cell.kemu.text = _kemu;
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 8;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.gradeVc.view.hidden = NO;
    [self.gradeVc setGradeName:_kemu biaoshi:@"yixiang"];
    
    
}

- (LZInfoGradeViewController *)gradeVc {
    
    if (!_gradeVc) {
        _gradeVc = [[LZInfoGradeViewController alloc] init];
        _gradeVc.view.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
        _gradeVc.view.hidden = YES;
        __weak typeof(self) weakSelf = self;
        
        _gradeVc.chooseSubjectModelBlock= ^(NSArray *subjectArr) {
            weakSelf.gradeVc.view.hidden = YES;
            weakSelf.model.expectSkills = subjectArr;
            [weakSelf dataArrInit];
            
            
        };
        
        [self.navigationController addChildViewController:_gradeVc];
        [self.navigationController.view addSubview:_gradeVc.view];
        
        
    }
    
    return _gradeVc;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
