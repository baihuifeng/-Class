//
//  LZDetaiCellHeadView.m
//  Student
//
//  Created by bai on 2017/3/26.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZDetaiCellHeadView.h"

@implementation LZDetaiCellHeadView

- (id)initWithFrame:(CGRect)frame contentText:(NSString *)contentText countText:(NSString *)countText {
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        _contentLabel.text = contentText;
        if (countText.length == 0) {
            _countLabel.hidden = YES;
        } else {
            _countLabel.hidden = NO;
            [_countLabel setTitle:countText forState:UIControlStateNormal];
        }
        self = [[[NSBundle mainBundle] loadNibNamed:@"LZDetaiCellHeadView" owner:self options:nil] lastObject];
    }
    
    return self;
}

- (IBAction)countBtn:(UIButton *)sender {

}


@end
