//
//  LZBalanceViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/4/6.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZBalanceViewController.h"

@interface LZBalanceViewController ()

@end

@implementation LZBalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _balanceTableView.tableFooterView = [[UIView alloc] init];
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 1) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 100)];
        UIButton *balanceBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        balanceBtn.frame = CGRectMake((kScreen_Width-281)/2, 10, 281, 35);
        [balanceBtn setTitle:@"提现" forState:UIControlStateNormal];
        [balanceBtn setBackgroundColor:UICOLOR_RGB_Alpha(0x23cd77, 1.0)];
        [balanceBtn setTintColor:[UIColor clearColor]];
        [balanceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [view addSubview:balanceBtn];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width-281)/2, 55, 281, 35)];
        label.text = @"最快两小时内到账";
        label.textColor = UICOLOR_RGB_Alpha(0x696969, 1.0);
        label.font = [UIFont systemFontOfSize:13.0];
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        
        return view;
        
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == 1) {
        return 100;
    }
    
    return 0;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

@end
