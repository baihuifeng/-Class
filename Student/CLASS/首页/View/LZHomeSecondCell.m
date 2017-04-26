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
#import "LZClassesViewController.h"

@implementation LZHomeSecondCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    

}

- (void)setDataArr:(NSArray *)dataArr homeModel:(LZHomeModel *)homeModel {
    _homeModel = homeModel;
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
    [cell.img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ManagerUrl,model.tagImgUrl]] placeholderImage:nil];

    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(kScreen_Width/5, 86);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    SkillsModel *model = _dataArr[indexPath.row];
    HHTabbarViewController *tabar = (HHTabbarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    LZClassesViewController *classVc = [[LZClassesViewController alloc] init];
    classVc.titleModel = model;
    classVc.listModel = _homeModel;
    [(UINavigationController *)tabar.selectedViewController pushViewController:classVc animated:YES];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
