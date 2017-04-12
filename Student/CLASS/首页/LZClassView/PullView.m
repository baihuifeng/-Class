//
//  PullView.m
//  HomeHealth
//
//  Created by 葬花桥 on 2016/12/29.
//  Copyright © 2016年 ChiJian. All rights reserved.
//

#import "PullView.h"

@implementation PullView

- (id)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor redColor];
        
        
        NSMutableArray *imageQ = [[NSMutableArray alloc] init];
        NSMutableArray *imageH = [[NSMutableArray alloc] init];
        
        for (int i= 0; i <titleArr.count; i++) {
            [imageQ addObject:@"形状-2-副本-4@2x"];
            [imageH addObject:@"形状-2-副本-6@2x"];
        }
//        __weak typeof(self) weakSelf = self;
        _titleArr = titleArr;
//        _jySiftView = [[JYSiftview alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 40) titles:titleArr normalImages:imageQ selsctedImages:imageH slectBolck:^(NSInteger index) {
//            [weakSelf sender:index];
//        }];
//        [self addSubview:_jySiftView];
    }
    
    
    _dataArr = [[NSMutableArray alloc] init];
    for (int i = 0 ; i<titleArr.count; i++) {
        
        PullModel *model = [[PullModel alloc] init];
        model.name = @"name";
        model.code = @"01";
        [_dataArr addObject:@[model]];
    }
    return self;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    if (_selectedIndex < _titleArr.count) {
        [self.pullBackView showView:self.pullBackView itmesCount:(int)_titleArr.count];
        [self.pullBackView reloadDate:(int)_selectedIndex dateArr:_dataArr];
    }else {
        [_pullBackView dismissView];
    }
}


    


- (PullBackView *)pullBackView {
    if (!_pullBackView) {
        _pullBackView = [[PullBackView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
        __weak typeof(self) weakSelf = self;
        [_pullBackView setFilterResultBlock:^(NSArray *dataArr,int index) {
            

            
            if (weakSelf.filterResultBlock) {
                weakSelf.filterResultBlock(dataArr);
            }
        }];
        [self addSubview:_pullBackView];
    }
    return _pullBackView;
}






@end
