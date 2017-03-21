//
//  LZHomeSecondCell.m
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZHomeSecondCell.h"
#import "LZSecondItmesCell.h"

@implementation LZHomeSecondCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[LZSecondItmesCell class] forCellWithReuseIdentifier:@"LZSecondItmesCell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 7;
}

//返回多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
//加载cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LZSecondItmesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LZSecondItmesCell" forIndexPath:indexPath];

    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(kScreen_Width/5, 86);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
