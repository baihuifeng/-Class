//
//  LZClassesViewController.h
//  Student
//
//  Created by 葬花桥 on 2017/3/21.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZRootViewController.h"
#import "LZTeacherListModel.h"

@interface LZClassesViewController : LZRootViewController <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *chooseCollection;
@property (strong, nonatomic) IBOutlet UITableView *classesListTableView;
@property (nonatomic,copy) NSString *parentId;

@property (nonatomic,strong) SkillsModel *titleModel;

@property (nonatomic,strong) LZHomeModel *listModel;

@end
