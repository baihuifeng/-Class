//
//  LZTagsView.m
//  Student
//
//  Created by 白慧峰 on 2017/4/18.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZTagsView.h"


#define NH_tagHeight 16
#define NH_tagHSpace 2
#define NH_tagWSpace 4
#define NH_tagFont [UIFont systemFontOfSize:12]


@implementation LZTagsView


+ (UILabel *)getTag:(NSString *)tagString x:(CGFloat)x y:(CGFloat)y w:(CGFloat)w backColor:(UIColor *)backColor titleColor:(UIColor *)titltcolor {
    
    UILabel *tagLabel = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, 14)];
    tagLabel.clipsToBounds = YES;
    tagLabel.layer.cornerRadius = 2;
    tagLabel.text = tagString;
    tagLabel.font = [UIFont systemFontOfSize:11];
    tagLabel.textColor = titltcolor;
//    tagLabel.backgroundColor = backColor;
    tagLabel.layer.borderColor = titltcolor.CGColor;
    tagLabel.layer.borderWidth = 0.5;
    tagLabel.textAlignment = NSTextAlignmentCenter;
    return tagLabel;
}
+(CGFloat)getTagLabelWidth:(NSString *)string{
    NSMutableParagraphStyle *pStyle = [[NSMutableParagraphStyle alloc]init];
    [pStyle setLineBreakMode:NSLineBreakByCharWrapping];
    pStyle.lineSpacing = 0;
    
    CGRect matchRect = [string boundingRectWithSize:CGSizeMake(kScreen_Width - 16, 16) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:NH_tagFont,NSFontAttributeName,pStyle,NSParagraphStyleAttributeName, nil] context:nil];
    return matchRect.size.width + 6;
}

+ (UIView *)certificationTagsView:(NSString *)imgName title:(NSString *)titlt x:(CGFloat)x y:(CGFloat)y{
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, y, [LZTagsView getTagLabelWidth:titlt]+10, 12)];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 12, 12)];
    img.image = [UIImage imageNamed:imgName];
//    img.backgroundColor = [UIColor redColor];
    [view addSubview:img];
    img.contentMode = UIViewContentModeCenter;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, [NSString stringSizeWithString:titlt maxSize:CGSizeMake(CGFLOAT_MAX, 12) wordFont:12].width+3, 12)];
    label.text = titlt;
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentLeft;
//    label.backgroundColor = [UIColor redColor];
    label.textColor = UICOLOR_RGB_Alpha(0Xa8a8a8, 1.0);
    [view addSubview:label];
    
    
    
    return view;
}


@end
