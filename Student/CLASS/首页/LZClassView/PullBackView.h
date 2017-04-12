//
//  PullBackView.h
//  HomeHealth
//
//  Created by 葬花桥 on 2016/12/29.
//  Copyright © 2016年 ChiJian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullModel.h"




@interface PullBackView : UIView <UITableViewDelegate,UITableViewDataSource>

- (id)initWithFrame:(CGRect)frame;

- (void)showView:(UIView *)view itmesCount:(int)count;


@property (nonatomic,strong) UITableView *tableView;

@property (assign,nonatomic) int index;

@property (nonatomic,strong) NSArray *dataArr;

@property (nonatomic,strong) NSMutableArray *rowArr;
@property (nonatomic,strong) NSMutableArray *notesArr;

- (void)dismissView;

- (void)reloadDate:(int)index dateArr:(NSArray *)dateArr;

///筛选结果回调
@property (nonatomic, copy) void (^filterResultBlock) (NSArray *search,int index);



@end
