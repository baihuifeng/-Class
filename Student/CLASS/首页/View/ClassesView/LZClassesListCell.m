//
//  LZClassesListCell.m
//  Student
//
//  Created by 葬花桥 on 2017/3/21.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZClassesListCell.h"

@implementation LZClassesListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(ListModel *)model {
    _model = model;
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, _headImg.frame.size.height-15, _headImg.frame.size.width, 15)];
    view.backgroundColor = UICOLOR_RGB_Alpha(0x000000, 0.3);
    [_headImg addSubview:view];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _headImg.frame.size.width, 15)];
    label.text = @"一 对 一";
    label.textColor = UICOLOR_RGB_Alpha(0xffffff, 1.0);
    label.font = [UIFont systemFontOfSize:11.0];
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    

    
    
    
    [_pingfenView addSubview:[self viewCoutText:@"3.5"]];
    _pingfenW.constant = [self viewWidthCoutText:@"3.5"];
    [self layoutIfNeeded];
}

- (UIView *)viewCoutText:(NSString *)countText {

    int count = [countText intValue];
    
    NSMutableString *mString = [NSMutableString stringWithString:[NSString stringWithFormat:@"%.1f",[countText floatValue]]];
    //删除字符串中的空格
    NSString *str2 = [mString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%d.",count] withString:@""];
    NSLog(@"str2:%@",str2);
    UIView *view = [[UIView alloc] init];
    
    if ([str2 isEqualToString:@"0"]) {
        for (int i = 0; i<count; i++) {
            UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0.5+(i*12.5)+(i*5), 0.5, 12.5, 12.5)];
            img.image = [UIImage imageNamed:@"xiaolianicon"];
            [view addSubview:img];
        }
        view.frame = CGRectMake(0, 0, 12.5*count+10+(5*count+1), 13);

    } else {
        for (int i = 0; i<count+1; i++) {
            UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0.5+(i*12.5)+(i*5), 0.5, 12.5, 12.5)];
            img.image = count != i ? [UIImage imageNamed:@"xiaolianicon"] :[UIImage imageNamed:@"pinfenIcon"];
            [view addSubview:img];
        }
        view.frame = CGRectMake(0, 0, 12.5*(count+1)+(5*count+1), 13);
    
    }
    return view;

}

- (CGFloat)viewWidthCoutText:(NSString *)countText {
    
    int count = [countText intValue];
    
    NSMutableString *mString = [NSMutableString stringWithString:[NSString stringWithFormat:@"%.1f",[countText floatValue]]];
    //删除字符串中的空格
    NSString *str2 = [mString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%d.",count] withString:@""];
    NSLog(@"str2:%@",str2);
    UIView *view = [[UIView alloc] init];
    
    if ([str2 isEqualToString:@"0"]) {

        return 12.5*count+10+(5*count+1);
        
    } else {
        for (int i = 0; i<count+1; i++) {
            UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0.5+(i*12.5)+(i*5), 0.5, 12.5, 12.5)];
            img.image = count != i ? [UIImage imageNamed:@"xiaolianicon"] :[UIImage imageNamed:@"pinfenIcon"];
            [view addSubview:img];
        }
        return 12.5*(count+1)+(5*count+1);
        
    }

    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
