//
//  LZRegisterViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRegisterViewController.h"

@interface LZRegisterViewController ()

@end

@implementation LZRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
    if (!_password.text.length) {
        SWToast(@"请输入密码");
        return;
    } else {
        if ([NSString validateFigure:_password.text length:18]) {
            SWToast(@"密码不能为纯数字\n必须是6-18数字和英文组合");
            return;
        } else {
            
            if ([NSString validateEnglish:_password.text length:18]) {
                SWToast(@"密码不能为纯英文\n必须是6-18数字和英文组合");
                return;
            } else {
                if ([NSString validateCutomerName:_password.text length:18]) {
                    
                    if (_password.text.length < 6 || _password.text.length >18) {
                        SWToast(@"密码格式不正确\n必须是6-18数字和英文组合");
                        return;
                    }
                }
            }
        }
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
