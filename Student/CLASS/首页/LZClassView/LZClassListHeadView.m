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
        self.backgroundColor = UICOLOR_RGB_Alpha(0XFFFFFF, 1.0);
        
        NSArray *titleArr = @[@"智能排序",@"年级",@"授课区域",@"筛选"];
        NSMutableArray *buttonTableArr = [[NSMutableArray alloc] init];
        for (int i = 0; i<4; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(kScreen_Width/4*i, 0, kScreen_Width/4, 40);
            [button setTitle:titleArr[i] forState:UIControlStateNormal];
            [button setTitle:titleArr[i] forState:UIControlStateSelected];
            [button setTitleColor:UICOLOR_RGB_Alpha(0X666666, 1.0) forState:UIControlStateNormal];
            [button setTitleColor:UICOLOR_RGB_Alpha(0X23CD77, 1.0) forState:UIControlStateSelected];
            button.titleLabel.font = [UIFont systemFontOfSize:14.0];
            button.tintColor = [UIColor clearColor];
            
            [buttonTableArr addObject:button];
            button.tag = i+100;
            [button addTarget:self action:@selector(index:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            
        
            
        }
        
        _buttonArr = buttonTableArr;
        
    }
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, kScreen_Width, 0.5)];
    view.backgroundColor = UICOLOR_RGB_Alpha(0Xeeeeee, 1.0);
    [self addSubview:view];
    
    UIView *topview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 0.5)];
    topview.backgroundColor = UICOLOR_RGB_Alpha(0Xeeeeee, 1.0);
    [self addSubview:topview];
    
    return self;
    
}

- (void)setIndex:(int)index {
    _index = index;
    
    for (int i = 0; i<_buttonArr.count; i++) {
        UIButton *btn = _buttonArr[i];
        if (i == index) {
            btn.selected = YES;
            
            if (self.filterResultBlock) {
                self.filterResultBlock(index);
            }
            
        } else {
            btn.selected = NO;
        }
    }
    
    
}

- (void)senderTags:(UIButton *)sender {
    

}

- (void)index:(UIButton *)sender {
    
    NSLog(@"%d",(int)sender.tag-100);
    self.index = (int)sender.tag-100;
    


}


@end
