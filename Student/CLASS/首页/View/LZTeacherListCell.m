//
//  LZTeacherListCell.m
//  Student
//
//  Created by bai on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZTeacherListCell.h"
#import "LZTagsView.h"



@implementation LZTeacherListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}


- (void)setModel:(ListModel *)model {
    _model = model;
    [_imgUrl sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ManagerUrl,model.imgUrl]] placeholderImage:nil];
    _title.text = model.title;
    _price.text = model.price;
    
    _priceW.constant = [NSString stringSizeWithString:_price.text maxSize:CGSizeMake(CGFLOAT_MAX, 15) wordFont:15].width+5;
    
    if ([model.isExclusive isEqualToString:@"0"]) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, _imgUrl.frame.size.height-15, _imgUrl.frame.size.width, 15)];
        view.backgroundColor = UICOLOR_RGB_Alpha(0x000000, 0.3);
        [_imgUrl addSubview:view];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _imgUrl.frame.size.width, 15)];
        label.text = @"一 对 一";
        label.textColor = UICOLOR_RGB_Alpha(0xffffff, 1.0);
        label.font = [UIFont systemFontOfSize:11.0];
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
    }
    
    
    _titleW.constant = [NSString stringSizeWithString:_title.text maxSize:CGSizeMake(kScreen_Width-102-_priceW.constant-10, 15) wordFont:15].width+5;
    
    NSMutableArray *taginfo = [[NSMutableArray alloc] init];
    for (TagsInfoModel *tagStr in model.tagsInfo) {
        [taginfo addObject:tagStr.name];
    }
    
    _tagInfo.text = [taginfo componentsJoinedByString:@"　"];
    
    NSString *pingfen = [NSString stringWithFormat:@"%.f%%",[_model.satisfaction floatValue]/5*100];
    NSString *juli = [_model.distance floatValue] > 1000 ? [NSString stringWithFormat:@"%.2fKm",[_model.distance floatValue]/1000] : [NSString stringWithFormat:@"%@Km",_model.distance];
    
    _sexImg.image = [model.sex isEqualToString:@"男"] ? [UIImage imageNamed:@"LZ_nan_icon"] : [UIImage imageNamed:@"LZ_nv_icon"];
    
    NSArray *distent = @[pingfen,juli];
    
    
    int DstarX = 0;
    
    NSArray *ImgArr = @[@"LZHomePinglun_icon",@"LZHome_distence_icon"];
    int limitD=0;
    for (NSString *str in distent) {
        limitD+= [NSString stringSizeWithString:str maxSize:CGSizeMake(CGFLOAT_MAX, 12) wordFont:12].width+20;
    }
    
    
    int index = 0;
    
    for (NSString *tagStr in distent) {
        
        CGFloat lablelWidth = [LZTagsView getTagLabelWidth:tagStr];
        
        
        
        if ((DstarX + lablelWidth)>limitD) {
        }
        else {
            [self.distenceView addSubview:[LZTagsView certificationTagsView:ImgArr[index] title:tagStr x:DstarX y:0]];
            DstarX += lablelWidth + 20;
            
        }
        index++;
    }
    _distenceW.constant = limitD;
    
    
    [self layoutIfNeeded];
    
    int starX = 0;
    
    int starY = 0;
    
    int limitX = kScreen_Width-110;
    NSArray *titleArrColor = @[RGB(247, 112, 111),RGB(113, 37, 239),RGB(209, 100, 236),RGB(19, 144, 241),RGB(234, 103, 24),RGB(242, 182, 38)];
    int i = 0;
    for (NSString *tagStr in model.features) {
        
        CGFloat lablelWidth = [LZTagsView getTagLabelWidth:tagStr];
        UIColor *titleColor = titleArrColor[i%6];
        
        if ((starX + lablelWidth)>limitX) {
        }
        else {
            [self.tagSView addSubview:[LZTagsView getTag:tagStr x:starX y:starY w:lablelWidth backColor:nil titleColor:titleColor]];
            starX += lablelWidth + 4;
            
        }
        i++;
    }

    
    
    int Xstar = 0;
    
    
    int limit = kScreen_Width-limitD-100;
    for (NSString *tagStr in model.certificationTags) {
        
        CGFloat lablelWidth = [LZTagsView getTagLabelWidth:tagStr];
        
        if ((Xstar + lablelWidth+15)>limit) {
            return;
        }
        else {
            [self.certificationTags addSubview:[LZTagsView certificationTagsView:@"certification_icon" title:tagStr x:Xstar y:0]];
            Xstar += lablelWidth + 15;
            
        }
    }
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
