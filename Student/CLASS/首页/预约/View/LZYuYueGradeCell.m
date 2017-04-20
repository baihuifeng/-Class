//
//  LZYuYueGradeCell.m
//  Student
//
//  Created by 白慧峰 on 2017/4/18.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZYuYueGradeCell.h"

@implementation LZYuYueGradeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setDataArr:(NSArray *)dataArr index:(int)indexSelect{
    _dataArr = dataArr;
    
    int startX = 10;
    int startY = 10;
    int limitX =  kScreen_Width-26;
    CGFloat space = 10;
    int XNum = limitX/(75 + 10);
    _dataArr = [[NSMutableArray alloc] init];
    

    NSMutableArray *buttonMutableArr = [[NSMutableArray alloc] init];
    for (int i = 0; i<dataArr.count; i++) {
        GradesModel *Grades = dataArr[i];
        
        if (i%XNum == 0 && i) {
            startX = 0;
            startY += 25+10;
        }
        
        UIButton *button = [self SenderTagsName:Grades.gradeName x:startX y:startY tag:i+100];
        
        NSLog(@"%@",Grades.gradeName);
        [self.contentView addSubview:button];
        startX += 75+space;
        
        [buttonMutableArr addObject:button];
    }
    _buttonArr = buttonMutableArr;
    
    self.index = indexSelect;
    
}

- (void)setIndex:(int)index {
    _index = index;
    
    for (int i = 0; i<_buttonArr.count; i++) {
        UIButton *btn = _buttonArr[i];
        if (i == index) {
            btn.selected = YES;
            
            if (self.filterResultBlock) {
                self.filterResultBlock(index);
            }
            
        } else {
            btn.selected = NO;
        }
    }
    
    
}

+ (CGFloat)gradeNameArr:(NSArray *)dataArr {

    int startX = 10;
    int startY = 10;
    int limitX =  kScreen_Width-26;
    CGFloat space = 10;
    int XNum = limitX/(75 + 10);
    
    
    for (int i = 0; i<dataArr.count; i++) {
        if (i%XNum == 0 && i) {
            startX = 0;
            startY += 25+10;
        }
        startX += 75+space;
    }
    return startY+40;
    
}

- (UIButton *)SenderTagsName:(NSString *)name x:(CGFloat)x y:(CGFloat)y tag:(int)tag{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(x, y, 75, 25);
    [button setBackgroundImage:[UIImage imageNamed:@"publishTagQ"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"publishTagS"] forState:UIControlStateSelected];
    [button setTitleColor:UICOLOR_RGB_Alpha(0X969595, 1.0) forState:UIControlStateNormal];
    [button setTitleColor:UICOLOR_RGB_Alpha(0XF5A623, 1.0) forState:UIControlStateSelected];
    [button setTitle:name forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTintColor:[UIColor clearColor]];
    button.tag = tag;
    [button addTarget:self action:@selector(senderTags:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)senderTags:(UIButton *)sender {
    
    NSLog(@"%d",(int)sender.tag-100);
    self.index = (int)sender.tag-100;
}


#pragma -价格

- (void)setPriceModel:(NSArray *)priceArr index:(int)priceIndex {
//    _priceModel = priceModel;
    
//    NSMutableArray *titleArr = [[NSMutableArray alloc] init];
//    if (priceModel.visit) {
//        [titleArr addObject:[NSString stringWithFormat:@"老师上门\n%@/小时",priceModel.visit]];
//    }
//    
//    if (priceModel.come) {
//        [titleArr addObject:[NSString stringWithFormat:@"学生上门\n%@/小时",priceModel.come]];
//    }
    
    
    NSMutableArray *priceMutableArr = [[NSMutableArray alloc] init];
    
    for (int i= 0; i < priceArr.count; i++) {
        PriceModel *model = priceArr[i];
        UIButton *button = [self SenderTagsName:[NSString stringWithFormat:@"%@\n%@",model.serviceName,model.price] x:10+i*100 tag:i+10];
        
        [self.contentView addSubview:button];
        [priceMutableArr addObject:button];
    }
    
    _priceBtnArr = priceMutableArr;
    
    self.indexPrice = priceIndex;
  
}

- (void)setIndexPrice:(int)indexPrice {
    _indexPrice = indexPrice;
    for (int i = 0; i<_priceBtnArr.count; i++) {
        UIButton *btn = _priceBtnArr[i];
        if (i == _indexPrice) {
            btn.selected = YES;
        } else {
            btn.selected = NO;
        }
    }
    
}


- (UIButton *)SenderTagsName:(NSString *)name x:(CGFloat)x tag:(int)tag{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(x, 10, 71, 41);
    [button setBackgroundImage:[UIImage imageNamed:@"price_deful_icon"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"price_selected_icon"] forState:UIControlStateSelected];
    [button setTitleColor:UICOLOR_RGB_Alpha(0X969595, 1.0) forState:UIControlStateNormal];
    [button setTitleColor:UICOLOR_RGB_Alpha(0XF5A623, 1.0) forState:UIControlStateSelected];
    [button setTitle:name forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTintColor:[UIColor clearColor]];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.numberOfLines = 2;
    button.tag = tag;
    [button addTarget:self action:@selector(priceTags:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)priceTags:(UIButton *)sender {
    self.indexPrice = (int)sender.tag-10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
