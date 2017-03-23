//
//  HHTabbarViewController.m
//  HomeHealth
//
//  Created by zhangwei on 16/12/28.
//  Copyright © 2016年 ChiJian. All rights reserved.
//

#import "HHTabbarViewController.h"
#import "HHNavigationViewController.h"
#import "HHTababr.h"

#import "GeneralDefine.h"

#import "LZHomeViewController.h"
#import "LZSTeacherViewController.h"
#import "LZCourseViewController.h"
#import "LZMineViewController.h"

@interface HHTabbarViewController ()<UITabBarControllerDelegate>

@property (nonatomic , strong) UIViewController * lastSelectedController;
@end

@implementation HHTabbarViewController

+ (void)initialize {
    // 通过appearance统一设置所有的UIBarBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法，都可以用appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = KThemeColor;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控制器
    [self setupChildVc:[LZHomeViewController new] title:@"首页" image:@"tab_Home" selectedImage:@"tab_Home_ed"];
//
    [self setupChildVc:[LZSTeacherViewController new] title:@"老师" image:@"tab_jieyi" selectedImage:@"tab_jie_yied"];
//
    [self setupChildVc:[LZCourseViewController new] title:@"课程" image:@"tab_kebiao" selectedImage:@"tab_kebiao _ed"];
    
     [self setupChildVc:[LZMineViewController new] title:@"我的" image:@"tab_mine" selectedImage:@"tab_mine_ed"];
    
//    // 更换tabBar
     [self setValue:[[HHTababr alloc] init] forKey:@"tabBar"];
    
    

}


/**
 *  初始化控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    // 设置文字图片
    vc.tabBarItem.title = title;
    UIImage *imageOriginal =  [UIImage imageNamed:image];
    UIImage *selectedImageOriginal =  [UIImage imageNamed:selectedImage];
    vc.tabBarItem.image =[imageOriginal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [selectedImageOriginal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.title = title;
    // 包装一个导航控制器，添加导航控制器为tabBarController的子控制器
    HHNavigationViewController *nav = [[HHNavigationViewController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (void)setSelectedViewController:(__kindof UIViewController *)selectedViewController{
    [super setSelectedViewController:selectedViewController];
    
//    if (self.lastSelectedController == selectedViewController) {
//
//        [[NSNotificationCenter defaultCenter]postNotificationName:JYNotificationCenterReSelectedTabbar object:nil];
//
//    }
    // 记录这一次选中的索引
    self.lastSelectedController = selectedViewController;
    

}


@end
