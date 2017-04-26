//
//  LZDetailBackView.m
//  Student
//
//  Created by bai on 2017/3/23.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZDetailBackView.h"

@implementation LZDetailBackView

- (id)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
      [self setup];
    }
    
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self setup];
}
- (void)setup{
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25];
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)]];
}

- (void)tap {

    NSLog(@"11111");
}

@end
