//
//  LZJumpNextViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZJumpNextViewController.h"
#import "HHTabbarViewController.h"

#import "LZLoginViewController.h"
#import "LZRegisterViewController.h"
#import "LZFoundPassWordViewController.h"

@implementation LZJumpNextViewController

/*
0:登录
*/

+ (void)presentNextViewController:(int)index Url:(NSString *)url title:(NSString *)titlt{
    
    HHTabbarViewController *tabar = (HHTabbarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    switch (index) {
        case 0:
        {
            LZLoginViewController *logVC = [[LZLoginViewController alloc] init];
            logVC.title = titlt;
            [(UINavigationController *)tabar.selectedViewController pushViewController:logVC animated:YES];
        }
            break;
        case 1:
        {
            LZRegisterViewController *RegVC = [[LZRegisterViewController alloc] init];
            RegVC.title = titlt;
            [(UINavigationController *)tabar.selectedViewController pushViewController:RegVC animated:YES];
        }
            break;
        case 2:
        {
            LZFoundPassWordViewController *FoundVC = [[LZFoundPassWordViewController alloc] init];
            FoundVC.title = titlt;
            [(UINavigationController *)tabar.selectedViewController pushViewController:FoundVC animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}

@end
