//
//  LZLoginViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZLoginViewController.h"

@interface LZLoginViewController ()

@end

@implementation LZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = UICOLOR_RGB_Alpha(0xFFFFFF, 1);
    _topHeight.constant = kScreen_Width/320*65;
    [self.view layoutIfNeeded];
    
}
- (IBAction)registBtn:(UIButton *)sender {
    [LZJumpNextViewController presentNextViewController:1 Url:@"" title:@"注册"];
}
- (IBAction)foundBtn:(UIButton *)sender {
    [LZJumpNextViewController presentNextViewController:2 Url:@"" title:@"找回密码"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillAppear:animated];
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
