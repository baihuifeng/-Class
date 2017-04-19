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
#import "LZClassListHeadView.h"
#import "LZClassItmeListView.h"
#import "PullView.h"

@interface LZClassesViewController ()

@property (nonatomic,strong) NSMutableArray *dataArr;

@property (nonatomic,strong) PullView *pullView;


@end

@implementation LZClassesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _classesListTableView.tableFooterView = [[UIView alloc]init];
    
    LZClassItmeListView *lzClassView = [[LZClassItmeListView alloc] init];
    lzClassView.frame = CGRectMake(0, -130, kScreen_Width, 130);
    lzClassView.backgroundColor = [UIColor redColor];
    
    [_classesListTableView addSubview:lzClassView];
    
    
    
    _dataArr = [[NSMutableArray alloc] init];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"ListJson"ofType:@"json"];
    
    //根据文件路径读取数据
    NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];
    
    
    //格式化成json数据
    NSMutableDictionary *dic= [NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingAllowFragments error:nil];
    
    //    NSLog(@"-----%@",dic);
    
//    _model = [LZDetailModel mj_objectWithKeyValues:dic];
//    [_dataArr addObject:[ListModel mj_objectArrayWithKeyValuesArray:dic[@"data"]]];
//    NSArray *arr = ;
    
    [_dataArr addObjectsFromArray:[ListModel mj_objectArrayWithKeyValuesArray:dic[@"data"]]];
    
    
    
    
    [_classesListTableView reloadData];
    
    
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _classesListTableView.contentOffset = CGPointMake(0, -130);
        _classesListTableView.contentInset = UIEdgeInsetsMake(130, 0, 0, 0);
    });
    
    
    
}



#pragma -mark tableViewViewdelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    return _dataArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 80;  
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    LZClassesListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZClassesListCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LZClassesListCell" owner:self options:nil] lastObject];
    }
    cell.model = _dataArr[indexPath.row];

    return cell;
    
    


    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LZTeacherDetailViewController *detailVc = [[LZTeacherDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
        LZClassListHeadView *headView = [[LZClassListHeadView alloc] init];
        headView.frame = CGRectMake(0, 0, kScreen_Width, 45);
    headView.filterResultBlock = ^(NSInteger index) {
        
        

        [_classesListTableView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        self.pullView.selectedIndex = index;
        [UIView animateWithDuration:10 animations:^{
            self.pullView.hidden = NO;
            
        }];
 
        
        
    
    };
        return headView;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

        return 45;

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    NSLog(@"1111    f = %f",-scrollView.contentOffset.y);
    
    if (-scrollView.contentOffset.y <= 0) {
            _classesListTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        return;
    } else if (-scrollView.contentOffset.y >= 130) {
        _classesListTableView.contentInset = UIEdgeInsetsMake(130, 0, 0, 0);
    } else {
        _classesListTableView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    
    
    
    
    
}

- (PullView *)pullView {
    if (!_pullView) {
        _pullView = [[PullView alloc] initWithFrame:CGRectMake(0, 45, kScreen_Width, kScreen_Height-100) titleArr:@[@"",@"",@"",@""]];
        _pullView.hidden = YES;
        [self.view addSubview:_pullView];
    }
    return _pullView;
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
