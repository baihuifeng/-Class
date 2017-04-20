//
//  LZRootViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/17.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"
#import "JYCustomPullGifHeader.h"

@interface LZRootViewController ()

@end

@implementation LZRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = JYControllerBackColor;
}



- (void)setRefreshHeader:(UITableView *)tableView completion:(void (^)(void))completion{
    
        __unsafe_unretained __typeof(self) weakSelf = self;
        JYCustomPullGifHeader *header = [JYCustomPullGifHeader headerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 刷新表格
                // 刷新表格
                [weakSelf refreshRequest];
            });
        }];
    
        // 隐藏时间
        header.lastUpdatedTimeLabel.hidden = YES;
    
        // 隐藏状态
        header.stateLabel.hidden = YES;
    // 设置header
    
//    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:completion];
    header.lastUpdatedTimeLabel.hidden = YES;
    tableView.mj_header = header;
    
}


- (void)index:(NSInteger)index {

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
