//
//  LZHomeHeadView.m
//  Student
//
//  Created by 葬花桥 on 2017/3/21.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZHomeHeadView.h"

@implementation LZHomeHeadView

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        self = [[[NSBundle mainBundle] loadNibNamed:@"LZHomeHeadView" owner:self options:nil] lastObject];
    }
    
    return self;
}


- (void)setAddressStr:(NSString *)addressStr {
    _addressStr = addressStr;
    [_addressBtn setTitle:addressStr forState:UIControlStateNormal];

}

@end
