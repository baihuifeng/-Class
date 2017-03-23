//
//  LZHomeViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/17.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZHomeViewController.h"
#import "LZHomeFirstCell.h"
#import "LZHomeSecondCell.h"
#import "LZHomeThirdCell.h"
#import "LZHomeFourCell.h"
#import "LZHomeHeadView.h"

@interface LZHomeViewController ()

@end

@implementation LZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    LZHomeHeadView *headView = [[LZHomeHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 64)];
    headView.frame = CGRectMake(0, 0, kScreen_Width, 64);

    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:headView];

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return (kScreen_Width/320)*190;
    } else if (indexPath.section == 1) {
        return 87;
    } else if (indexPath.section == 2) {
        return 40;
    } else {
        return 570;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        LZHomeFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZHomeFirstCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZHomeFirstCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.section == 1) {
        LZHomeSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZHomeSecondCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZHomeSecondCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.section == 2) {
        LZHomeThirdCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZHomeThirdCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZHomeThirdCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
    
        LZHomeFourCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZHomeFourCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZHomeFourCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == 2) {
        return 5;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return 5;
    }
    return 0;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
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
