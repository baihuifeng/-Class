//
//  LZTagsView.h
//  Student
//
//  Created by 白慧峰 on 2017/4/18.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZTagsView : NSObject

+(UILabel *)getTag:(NSString *)tagString x:(CGFloat)x y:(CGFloat)y w:(CGFloat)w backColor:(UIColor *)backColor titleColor:(UIColor *)titltcolor;
+(CGFloat)getTagLabelWidth:(NSString *)string;

+ (UIView *)certificationTagsView:(NSString *)imgName title:(NSString *)titlt x:(CGFloat)x y:(CGFloat)y;

@end
