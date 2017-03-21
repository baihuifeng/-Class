//
//  LZHomeFirstCell.m
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZHomeFirstCell.h"


@implementation LZHomeFirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    SDCycleScrollView *scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreen_Width, (kScreen_Width/320)*190) delegate:self placeholderImage:[UIImage imageNamed:@"3333"]];
    scrollView.showPageControl = YES;
    scrollView.delegate = self;
    scrollView.imageURLStringsGroup = @[@"http://image1.jyall.com/v1/tfs/T1ytATBTYv1R4cSCrK.png",@"http://image1.jyall.com/v1/tfs/T1ytATBTYv1R4cSCrK.png",@"http://image1.jyall.com/v1/tfs/T1ytATBTYv1R4cSCrK.png"];
    scrollView.currentPageDotImage = [UIImage imageNamed:@"2222"];
    scrollView.pageDotImage = [UIImage imageNamed:@"1111"];
    [_headView addSubview:scrollView];
    
}

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
    
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
