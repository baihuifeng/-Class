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
    [self setupChildVc:[LZHomeViewController new] title:@"" image:@"shouye_icon_deful" selectedImage:@"shouye_icon_selected"];
//
    [self setupChildVc:[LZSTeacherViewController new] title:@"" image:@"jieyi_icon_deful" selectedImage:@"jieyi_icon_selected"];
//
    [self setupChildVc:[LZCourseViewController new] title:@"" image:@"kebiao_icon_deful" selectedImage:@"kebiao_icon_selected"];
    
     [self setupChildVc:[LZMineViewController new] title:@"" image:@"mine_icon_deful" selectedImage:@"mine_icon_selected"];
    
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
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(8,0, -8, 0);
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
