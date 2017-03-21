//
//  LZHomeThirdCell.h
//  Student
//
//  Created by 葬花桥 on 2017/3/20.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZHomeThirdCell : UITableViewCell <UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic , strong) NSTimer *timer;

@end
