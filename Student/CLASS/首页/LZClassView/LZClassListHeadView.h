//
//  LZClassListHeadView.h
//  Student
//
//  Created by bai on 2017/3/30.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentView.h"
@interface LZClassListHeadView : UIView <selectedDelegate>

@property (weak, nonatomic) IBOutlet UIView *headView;

///回调
@property (nonatomic, copy) void (^filterResultBlock) (NSInteger index);
@end
