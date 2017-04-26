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
    _selectedArr = [[NSMutableArray alloc] init];
    
    _index = indexSelect;
    int startX = 10;
    int startY = 10;
    int limitX =  kScreen_Width-26;
    CGFloat space = 10;
    int XNum = limitX/(75 + 10);
//    _dataArr = [[NSMutableArray alloc] init];
    

    NSMutableArray *buttonMutableArr = [[NSMutableArray alloc] init];
    for (int i = 0; i<dataArr.count; i++) {
        GradesModel *Grades = dataArr[i];
        
        if (i%XNum == 0 && i) {
            startX = 0;
            startY += 25+10;
        }
        
        UIButton *button = nil;
        if (indexSelect == 1) {
          button =  [self SenderTagsName:Grades.gradeName x:startX y:startY tag:i+100];
        } else {
          button =[self SenderTagsName:Grades.name x:startX y:startY tag:i+100];
        }
        
        
        NSLog(@"%@",Grades.gradeName);
        [self.contentView addSubview:button];
        startX += 75+space;
        
        [buttonMutableArr addObject:button];
    }
    _buttonArr = buttonMutableArr;
    
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
    sender.selected = !sender.selected;
    if (sender.selected == YES) {
        [_selectedArr removeObject:_dataArr[sender.tag-100]];
    } else {
        [_selectedArr addObject:_dataArr[sender.tag-100]];
    }
    
    if (self.filterResultBlock) {
        self.filterResultBlock(_selectedArr);
    }
    
}


#pragma -价格

- (void)setPriceModel:(PriceModel *)PriceModel index:(int)priceIndex {
    
    NSMutableArray *priceMutableArr = [[NSMutableArray alloc] init];
    
    for (int i= 0; i < PriceModel.mode.count; i++) {
        ComeWithGoModel *model = PriceModel.mode[i];
        UIButton *button = [self SenderTagsName:[NSString stringWithFormat:@"%@\n%@",model.serviceName,model.priceDescribe] x:10+i*100 tag:i+10];
        
        [self.contentView addSubview:button];
        [priceMutableArr addObject:button];
    }
    
    _priceBtnArr = priceMutableArr;

  
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
//    self.indexPrice = (int)sender.tag-10;
    
    for (int i = 0; i<_priceBtnArr.count; i++) {
        UIButton *btn = _priceBtnArr[i];
        if (i == (int)sender.tag-10) {
            btn.selected = YES;
        } else {
            btn.selected = NO;
        }
    }
    
    if (self.priceBlock) {
        self.priceBlock((int)sender.tag-10);
        
    }
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
