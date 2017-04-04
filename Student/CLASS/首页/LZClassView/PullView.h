//
//  PullView.h
//  HomeHealth
//
//  Created by 葬花桥 on 2016/12/29.
//  Copyright © 2016年 ChiJian. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "JYSiftview.h"
#import "PullBackView.h"


@interface PullView : UIView

- (id)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr;


//@property (nonatomic,strong) JYSiftview *jySiftView;

@property (nonatomic,strong) PullBackView *pullBackView;

@property (nonatomic,strong) NSArray *titleArr;

@property (nonatomic,strong) NSMutableArray *dataArr;


///筛选结果回调
@property (nonatomic, copy) void (^filterResultBlock) (NSArray *dataArr);


@property (nonatomic,assign) NSInteger selectedIndex;

@end
