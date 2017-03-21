//
//  LZClassesViewController.h
//  Student
//
//  Created by 葬花桥 on 2017/3/21.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"

@interface LZClassesViewController : LZRootViewController <UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *chooseCollection;
@property (strong, nonatomic) IBOutlet UITableView *classesListTableView;

@end
