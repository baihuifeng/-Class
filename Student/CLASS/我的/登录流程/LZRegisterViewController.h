//
//  LZRegisterViewController.h
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"
#import "JYAccount.h"

@interface LZRegisterViewController : LZRootViewController
@property (weak, nonatomic) IBOutlet UITextField *teleText;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (nonatomic,strong) JYAccount *infoModel;
@property (weak, nonatomic) IBOutlet UITextField *code;

@end
