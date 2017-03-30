//
//  LZCodeLoginViewController.m
//  Student
//
//  Created by bai on 2017/3/29.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZCodeLoginViewController.h"

@interface LZCodeLoginViewController ()

@end

@implementation LZCodeLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)codeBtn:(UIButton *)sender {
    if (!_teleText.text.length) {
        SWToast(@"请输入手机号码");
        return;
    } else {
        if (![[NSStringVerify sharedInstance] isValidateMobile:_teleText.text]) {
            SWToast(@"请输入正确的手机号码");
            return;
        }
    }
    
}
- (IBAction)finishBtn:(UIButton *)sender {
    
    if (!_teleText.text.length) {
        SWToast(@"请输入手机号码");
        return;
    } else {
        if (![[NSStringVerify sharedInstance] isValidateMobile:_teleText.text]) {
            SWToast(@"请输入正确的手机号码");
            return;
        }
    }
    
    if (!_codeText.text.length) {
        SWToast(@"请输入验证码");
        return;
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
