//
//  LZTeacherDetailViewController.h
//  Student
//
//  Created by 葬花桥 on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"

@interface LZTeacherDetailViewController : LZRootViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *DetailtableView;
@property (weak, nonatomic) IBOutlet UIButton *isCollection;

@property (nonatomic,copy) NSString *teacherId;



@end
