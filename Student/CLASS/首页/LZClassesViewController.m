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
#import "LZChooseViewController.h"
#import "LZManagerChoose.h"

@interface LZClassesViewController ()

@property (nonatomic,strong) NSMutableArray *dataArr;

@property (nonatomic,strong) PullView *pullView;

@property (nonatomic,strong) LZChooseViewController *chooseVc;

@property (nonatomic,assign) int buttonIndex;

@property (nonatomic,strong) LZClassListHeadView *headView;


@property (nonatomic,assign) int sortIndex;//排序

@property (nonatomic,assign) int gradeIndex;//年级

@property (nonatomic,assign) int regionIndex;//区域

@property (nonatomic,strong) NSMutableArray *chooseIndexArr;

@property (nonatomic,strong) NSArray *moreArr;



@end

@implementation LZClassesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _chooseIndexArr = [NSMutableArray arrayWithObjects:@0,@0,@0,@0, nil];
    _moreArr = @[@0,@0,@0];
    
    [self.chooseVc dataArr:[LZManagerChoose getSequenceCondition] selectedIndex:[_chooseIndexArr[0] intValue]];
    
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
        _headView = [[LZClassListHeadView alloc] init];
        _headView.frame = CGRectMake(0, 0, kScreen_Width, 40);
    __weak typeof(self) weakSelf = self;
    _headView.filterResultBlock = ^(NSInteger index) {
        _buttonIndex = (int)index;
        
        [weakSelf.classesListTableView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.chooseVc.view.hidden = NO;
            if (index == 0) {
               [weakSelf.chooseVc dataArr:[LZManagerChoose getSequenceCondition] selectedIndex:[weakSelf.chooseIndexArr[index] intValue]];
            } else if (index == 1) {
                [weakSelf.chooseVc dataArr:[LZManagerChoose getgardeCondition] selectedIndex:[weakSelf.chooseIndexArr[index] intValue]];
            } else if (index == 2) {
                [weakSelf.chooseVc dataArr:[LZManagerChoose getRegionCondition] selectedIndex:[weakSelf.chooseIndexArr[index] intValue]];
            } else if (index == 3) {
                [weakSelf.chooseVc moreViewIndex:(int)index];
            }

        }];

    };
        return _headView;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

        return 40;

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


- (LZChooseViewController *)chooseVc {
    
    if (!_chooseVc) {
        _chooseVc = [[LZChooseViewController alloc] init];
        _chooseVc.view.frame = CGRectMake(0, 40, kScreen_Width, kScreen_Height);
        _chooseVc.view.hidden = YES;
        __weak typeof(self) weakSelf = self;
        _chooseVc.rowBlock = ^(NSInteger rowIndex,NSArray *moreArr) {
            
            [weakSelf.chooseIndexArr replaceObjectAtIndex:weakSelf.buttonIndex withObject:@(rowIndex)];
            weakSelf.chooseVc.view.hidden = YES;
            for (UIButton *btn in weakSelf.headView.buttonArr) {
                btn.selected = NO;
            }
            weakSelf.moreArr = moreArr;
            
            NSLog(@"-------=======>>>>%@,%@",weakSelf.chooseIndexArr,weakSelf.moreArr);
        };
        [self addChildViewController:_chooseVc];
        [self.view addSubview:_chooseVc.view];
        
        
    }
    
    return _chooseVc;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
