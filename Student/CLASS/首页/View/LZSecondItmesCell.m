//
//  LZSecondItmesCell.m
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZSecondItmesCell.h"

@implementation LZSecondItmesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"LZSecondItmesCell" owner:self options:nil];
        self = [arr objectAtIndex:0];
        
    }
    return self;
    
}

@end
