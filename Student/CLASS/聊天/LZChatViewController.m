//
//  LZChatViewController.m
//  Student
//
//  Created by 白慧峰 on 2017/4/21.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZChatViewController.h"

@interface LZChatViewController ()

@end

@implementation LZChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)messageViewController:(EaseMessageViewController *)viewController
  didSelectAvatarMessageModel:(id<IMessageModel>)messageModel{
    
    NSLog(@"%@",messageModel);

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
