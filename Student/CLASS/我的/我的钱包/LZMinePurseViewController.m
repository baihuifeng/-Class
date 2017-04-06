//
//  LZMinePurseViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/4/6.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZMinePurseViewController.h"
#import "LZMinePurseFirstCell.h"
#import "LZMinePurseSecondCell.h"
#import "LZProfitDetailViewController.h"
#import "LZBalanceViewController.h"

@interface LZMinePurseViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *titleArr;

@end

@implementation LZMinePurseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _payTableView.tableFooterView = [[UIView alloc] init];
    _titleArr = @[@"我的押金",@"提现",@"我的押金"];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return _titleArr.count;
    }
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 156;
    } else if (indexPath.section == 1) {
        return 60;
    }
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        LZMinePurseFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZMinePurseFirstCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZMinePurseFirstCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.section == 1) {
        LZMinePurseSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZMinePurseSecondCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZMinePurseSecondCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        static NSString *str = @"qqq";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        
        cell.textLabel.text = _titleArr[indexPath.row];
//        cell.imageView.image =  [UIImage imageNamed:_secondImgArr[indexPath.section-2][indexPath.row]];
        cell.textLabel.font = [UIFont systemFontOfSize:13.0];
        cell.textLabel.textColor = UICOLOR_RGB_Alpha(0x6a6a6a, 1);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LZPayViewController" bundle:nil];
        LZBalanceViewController *wvc = [storyboard instantiateViewControllerWithIdentifier:@"LZBalanceViewController"];
        [self.navigationController pushViewController:wvc animated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (IBAction)back:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)detail:(UIButton *)sender {
    LZProfitDetailViewController *payvc = [[LZProfitDetailViewController alloc] init];
    [self.navigationController pushViewController:payvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
