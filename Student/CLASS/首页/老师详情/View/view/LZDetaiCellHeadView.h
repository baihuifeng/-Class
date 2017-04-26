//
//  LZDetaiCellHeadView.h
//  Student
//
//  Created by bai on 2017/3/26.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZDetaiCellHeadView : UIView
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *countLabel;

- (id)initWithFrame:(CGRect)frame contentText:(NSString *)contentText countText:(NSString *)countText;


@end
