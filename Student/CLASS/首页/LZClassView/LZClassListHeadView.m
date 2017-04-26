//
//  LZClassListHeadView.m
//  Student
//
//  Created by bai on 2017/3/30.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZClassListHeadView.h"


@implementation LZClassListHeadView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        self.backgroundColor = UICOLOR_RGB_Alpha(0xdbdbdb, 1.0);
        SegmentView *segment = [[SegmentView alloc] initWithItmes:@[@"智能排序",@"年级",@"授课区域",@"筛选"] WithFrame:CGRectMake(0, 5, kScreen_Width, 40) LabelType:radiuLabelTypeBottom];
        segment.delegate = self;
        segment.backgroundColor = [UIColor redColor];
        segment.selectIndex = 0;
        segment.lineHeight = 20;
        segment.radiuLabelType = radiuLabelTypeBottom;
        segment.radiuView.isRadius = YES;
        segment.radiuView.radiusHeight = 2;
        
        [self addSubview:segment];
        
        
        
        
        
    }
    
    return self;
    
}

- (void)index:(NSInteger)index {
    if (self.filterResultBlock) {
        self.filterResultBlock(index);
    }

}


@end
