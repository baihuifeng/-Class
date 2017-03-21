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

@interface LZMineViewController ()

@property (nonatomic,strong) NSArray *secondArr;

@property (nonatomic,strong) NSArray *thirdArr;

@end

@implementation LZMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _secondArr = @[@"我的老师",@"学习意向",@"学习档案",@"分享给好友",@"投诉建议",@"客户电话",@"推荐奖励规则介绍",@"老师招募"];
    _thirdArr = @[@"设置"];
    _listTableView.tableFooterView = [[UIView alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 2) {
        return _secondArr.count;
    } else if (section == 3) {
        return _thirdArr.count;
    }
    return 1;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 90;
    } else if (indexPath.section == 1){
        return 53;
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
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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

        cell.textLabel.text = indexPath.section == 2 ? _secondArr[indexPath.row] : _thirdArr[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:13.0];
        cell.textLabel.textColor = UICOLOR_RGB_Alpha(0x6a6a6a, 1);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section != 3) {
        return 5;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        [LZJumpNextViewController presentNextViewController:0 Url:@"" title:@"登录"];
    }
    

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
