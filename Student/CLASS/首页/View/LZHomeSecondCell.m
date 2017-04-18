//
//  LZHomeSecondCell.m
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZHomeSecondCell.h"
#import "LZSecondItmesCell.h"
#import "LZTeacherListModel.h"

@implementation LZHomeSecondCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    

}

- (void)setDataArr:(NSArray *)dataArr {
    _dataArr = dataArr;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[LZSecondItmesCell class] forCellWithReuseIdentifier:@"LZSecondItmesCell"];
    [_collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataArr.count;
}

//返回多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
//加载cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LZSecondItmesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LZSecondItmesCell" forIndexPath:indexPath];
    SkillsModel *model = _dataArr[indexPath.row];
    cell.titleLabel.text = model.tagTitle;

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
