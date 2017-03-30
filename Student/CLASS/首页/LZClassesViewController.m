//
//  LZClassesViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/21.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZClassesViewController.h"
#import "LZClassesItmesCell.h"
#import "LZClassesListCell.h"
#import "LZTeacherDetailViewController.h"
#import "LZDetailStandardView.h"
#import "LZTeacherListModel.h"

@interface LZClassesViewController ()

@property (nonatomic,strong) NSMutableArray *dataArr;


@end

@implementation LZClassesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_chooseCollection registerClass:[LZClassesItmesCell class] forCellWithReuseIdentifier:@"LZClassesItmesCell"];
    
    _dataArr = [[NSMutableArray alloc] init];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"ListJson"ofType:@"json"];
    
    //根据文件路径读取数据
    NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];
    
    
    //格式化成json数据
    NSMutableDictionary *dic= [NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingAllowFragments error:nil];
    
    //    NSLog(@"-----%@",dic);
    
//    _model = [LZDetailModel mj_objectWithKeyValues:dic];
    [_dataArr addObject:[ListModel mj_objectArrayWithKeyValuesArray:dic[@"data"]]];
    
    
    [_classesListTableView reloadData];
    
    
}



#pragma -mark tableViewViewdelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;  //570
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LZClassesListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZClassesListCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LZClassesListCell" owner:self options:nil] lastObject];
    }
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LZTeacherDetailViewController *detailVc = [[LZTeacherDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVc animated:YES];
}




#pragma -mark collectionViewdelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 7;
}

//返回多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
//加载cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LZClassesItmesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LZClassesItmesCell" forIndexPath:indexPath];
    
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(kScreen_Width/4, 75);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
