//
//  LZClassListHeadView.h
//  Student
//
//  Created by bai on 2017/3/30.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentView.h"
@interface LZClassListHeadView : UIView 

@property (weak, nonatomic) IBOutlet UIView *headView;

@property (nonatomic,strong) NSArray *buttonArr;

@property (nonatomic,assign) int index;

///回调
@property (nonatomic, copy) void (^filterResultBlock) (NSInteger index);
@end
