//
//  LZMineViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/17.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZMineViewController.h"
#import "LZMineFirstCell.h"
#import "LZMineSecondCell.h"
#import "LZMineDetailViewController.h"
#import "LZMineTeacherViewController.h"
#import "LZYJViewController.h"
#import "LZMineYXViewController.h"
#import "LZDAViewController.h"


@interface LZMineViewController ()

@property (nonatomic,strong) NSArray *secondArr;
@property (nonatomic,strong) NSArray *secondImgArr;

@property (nonatomic,strong) JYAccount *model;

@end

@implementation LZMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.//
    _secondArr = @[@[@"学习档案",@"学习意向",@"投诉建议",@"客户电话",@"推荐奖励规则介绍"],@[@"分享给好友",@"老师招募"],@[@"设置"]];
    
    _secondImgArr = @[@[@"Mine_dangan",@"Mine_yixian",@"Mine_jianyi",@"Mine_kefu",@"Mine_tuijian"],@[@"Mine_fenxiang",@"Mine_zhaomu"],@[@"Mine_shezhi"]];

    _listTableView.tableFooterView = [[UIView alloc] init];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 2) {
        return [_secondArr[section-2] count];
    } else if (section == 3) {
        return [_secondArr[section-2] count];
    }
    return 1;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 160;
    } else if (indexPath.section == 1){
        return 60;
    } else {
        return 45;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        LZMineFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZMineFirstCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZMineFirstCell" owner:self options:nil] lastObject];
        }
        cell.model = _model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.section == 1) {
        LZMineSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZMineSecondCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZMineSecondCell" owner:self options:nil] lastObject];
        }
        return cell;
    } else {
        static NSString *str = @"qqq";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }

        cell.textLabel.text = _secondArr[indexPath.section-2][indexPath.row];
        cell.imageView.image =  [UIImage imageNamed:_secondImgArr[indexPath.section-2][indexPath.row]];
        cell.textLabel.font = [UIFont systemFontOfSize:13.0];
        cell.textLabel.textColor = UICOLOR_RGB_Alpha(0x6a6a6a, 1);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0 || section == 5) {
        return 0;
    }
    
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LZPayViewController" bundle:nil];
        LZMineDetailViewController *wvc = [storyboard instantiateViewControllerWithIdentifier:@"LZMineDetailViewController"];
        wvc.model = _model;
        wvc.comeApp = ComeCountApp;
        [self.navigationController pushViewController:wvc animated:YES];
    } else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            LZDAViewController *daVc = [[LZDAViewController alloc] init];
            daVc.title = @"学习档案";
            [self.navigationController pushViewController:daVc animated:YES];
        } else if (indexPath.row == 1) {
            LZMineYXViewController *yxVc = [[LZMineYXViewController alloc] init];
            
            JYAccount *infomodel = [JYAccountTool account];
            yxVc.model = infomodel;
            yxVc.comeApp = ComeCountApp;
            [self.navigationController pushViewController:yxVc animated:YES];
        } else if (indexPath.row == 4) {

        } else if (indexPath.row == 2) {
            LZYJViewController *jyVc = [[LZYJViewController alloc] init];
            [self.navigationController pushViewController:jyVc animated:YES];
        }  else {//
            LZMineTeacherViewController *teacherVc = [[LZMineTeacherViewController alloc] init];
            [self.navigationController pushViewController:teacherVc animated:YES];
        }

    } else {
        [LZJumpNextViewController presentNextViewController:0 Url:@"" title:@"登录"];
    }
    

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    _model = [JYAccountTool account];
    [_listTableView reloadData];
    
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
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
