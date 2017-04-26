//
//  LZHomeSecondCell.h
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZHomeSecondCell : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong,nonatomic) NSArray *dataArr;

@property (nonatomic,strong) LZHomeModel *homeModel;

- (void)setDataArr:(NSArray *)dataArr homeModel:(LZHomeModel *)homeModel;

@end
