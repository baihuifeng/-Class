//
//  SpecialityCell.m
//  Student
//
//  Created by 葬花桥 on 2017/3/23.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "SpecialityCell.h"

@implementation SpecialityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self drawLine];
}

- (void)setModel:(LZDetailModel *)model {
    _model = model;
    _characteristics.text = model.characteristics;
    _lineBackView.hidden = NO;
}
- (void)setModel:(LZDetailModel *)model caseIndex:(int)caseIndex {
    _characteristics.text = model.college;
    _lineBackView.hidden = YES;
}

-(void)drawLine{
    
    CAShapeLayer*shapeLayer = [CAShapeLayer layer];
    
    //    [shapeLayer setBounds:CGRectMake(0, 0, JYScreenWidth-130, 10)];
    
    
    [shapeLayer setPosition:CGPointMake(0,0)];
    
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    
    // 设置虚线颜色为blackColor
    //    [shapeLayer setStrokeColor:[[UIColor blackColor] CGColor]];
    [shapeLayer setStrokeColor:UICOLOR_RGB_Alpha(0x23cd77, 1).CGColor];
    
    //    设置虚线的宽度
    
    [shapeLayer setLineWidth:1.5f];
    
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    // 9=线的长度度 3=每条线的间距
    
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:1.5],nil]];
    
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path,NULL,0,0);
    
    CGPathAddLineToPoint(path,NULL,1000,0);
    
    [shapeLayer setPath:path];
    
    CGPathRelease(path);
    self.lineBackView.clipsToBounds = YES;
    [self.lineBackView.layer addSublayer:shapeLayer];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
