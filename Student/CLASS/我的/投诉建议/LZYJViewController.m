//
//  LZYJViewController.m
//  Student
//
//  Created by bai on 2017/3/27.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZYJViewController.h"

@interface LZYJViewController ()

@end

@implementation LZYJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button1 addTarget:self action:@selector(saveInfo:)
      forControlEvents:UIControlEventTouchUpInside];
    button1.frame = CGRectMake(0, 0, 50, 44);
    button1.titleLabel.font = [UIFont systemFontOfSize:15.0];
    button1.titleLabel.textAlignment = NSTextAlignmentRight;
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *address = [[UIBarButtonItem alloc] initWithCustomView:button1];
    [button1 setTitle:@"发送" forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItems = @[address];
    
    

    
    
    
}

- (void)saveInfo:(UIButton *)sender {
    [Tool showHUDAddedTo:self.view animated:YES];
    
    
    JYAccount *model = [JYAccountTool account];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:model.userId forKey:@"userId"];
    [dic setObject:_textView.text forKey:@"content"];
    
    [NetApiManager postToURL:LZJianYi bodyParams:dic finished:^(NetResponse *netResponse) {
        [Tool hideHUDForView:self.view animated:YES];
        if (netResponse.isSuccess) {
            
            [self.navigationController popToRootViewControllerAnimated:YES];
        } else {
            SWToast(@"失败\n请重新发送");
        }
        
    }];

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
