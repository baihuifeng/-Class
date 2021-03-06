//
//  LZClassItmeListView.m
//  Student
//
//  Created by bai on 2017/3/30.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZClassItmeListView.h"
#import "LZClassesItmesCell.h"

@implementation LZClassItmeListView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        self = [[[NSBundle mainBundle] loadNibNamed:@"LZClassItmeListView" owner:self options:nil] lastObject];
            [_chooseCollection registerClass:[LZClassesItmesCell class] forCellWithReuseIdentifier:@"LZClassesItmesCell"];
        _chooseCollection.delegate =self;
        _chooseCollection.dataSource = self;
    }
    
    return self;
}


- (void)setItmeArr:(NSArray *)itmeArr {
    _itmeArr = itmeArr;
    _chooseCollection.delegate =self;
    _chooseCollection.dataSource = self;
    [_chooseCollection reloadData];
    
}


#pragma -mark collectionViewdelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _itmeArr.count;
}

//返回多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
//加载cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LZClassesItmesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LZClassesItmesCell" forIndexPath:indexPath];
    SkillsModel *model = _itmeArr[indexPath.row];
    [cell.img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ManagerUrl,model.tagImgUrl]] placeholderImage:nil];
    cell.titleContent.text = model.tagTitle;
    
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(kScreen_Width/4, 75);
}


@end
