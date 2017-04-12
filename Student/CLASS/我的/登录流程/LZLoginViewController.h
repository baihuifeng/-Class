//
//  LZLoginViewController.h
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"

@interface LZLoginViewController : LZRootViewController

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topHeight;

@property (weak, nonatomic) IBOutlet UITextField *teleText;

@property (weak, nonatomic) IBOutlet UITextField *password;


@end
