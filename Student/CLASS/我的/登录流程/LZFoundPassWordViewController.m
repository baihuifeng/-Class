//
//  LZFoundPassWordViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZFoundPassWordViewController.h"

@interface LZFoundPassWordViewController ()

@end

@implementation LZFoundPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)codeSender:(JYCountButton *)sender {
    if (!_teleText.text.length) {
        SWToast(@"请输入手机号码");
        return;
    } else {
        if (![[NSStringVerify sharedInstance] isValidateMobile:_teleText.text]) {
            SWToast(@"请输入正确的手机号码");
            return;
        }
    }
    
    
    sender.enabled = NO;
    [sender startWithSecond:60];
    
//    [self.httpManager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
//        NSError *error;
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
//        NSLog(@"%@",dic);
//        _weighModel.identifyType = dic[@"identifyType"];
//        SWToast(@"验证码发送成功");
//        [sender didChange:^NSString *(JYCountButton *countDownButton,int second) {
//            NSString *title = [NSString stringWithFormat:@"剩余%d秒",second];
//            return title;
//        }];
//        [sender didFinished:^NSString *(JYCountButton *countDownButton, int second) {
//            countDownButton.enabled = YES;
//            return NSLocalizedString(@"retrieves", nil);
//            
//        }];
//        
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//        sender.enabled = YES;
//        [sender startWithSecond:0];
//        [sender didFinished:^NSString *(JYCountButton *countDownButton, int second) {
//            countDownButton.enabled = YES;
//            return NSLocalizedString(@"retrieves", nil);
//            
//        }];
//        SWToast(@"验证码发送失败");
//        
//    }];
    
    
    
    
    
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


@end
