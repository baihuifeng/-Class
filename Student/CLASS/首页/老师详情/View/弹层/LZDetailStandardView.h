//
//  LZDetailStandardView.h
//  Student
//
//  Created by bai on 2017/3/23.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZDetailBackView.h"

@interface LZDetailStandardView : LZDetailBackView <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *standerdTableView;



@end
