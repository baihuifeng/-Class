//
//  LZClassItmeListView.h
//  Student
//
//  Created by bai on 2017/3/30.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZClassItmeListView : UIView <UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *chooseCollection;

@end
