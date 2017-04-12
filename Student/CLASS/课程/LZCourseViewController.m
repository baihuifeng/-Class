//
//  LZCourseViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/17.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZCourseViewController.h"
#import "LZCourseFirstCell.h"
#import "LZCourseJudgeCell.h"
#import "LZPayViewController.h"
#import "LZCourseModel.h"


@interface LZCourseViewController ()
@property (nonatomic,strong) NSMutableArray *dataArr;

@property (assign,nonatomic) NSInteger indexSelect;

@end

@implementation LZCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _courseListTableView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
    
    SegmentView *segment = [[SegmentView alloc] initWithItmes:@[@"未上课",@"待支付",@"待评价",@"已完成"] WithFrame:CGRectMake(0, 0, kScreen_Width, 39) LabelType:radiuLabelTypeBottom];
    segment.delegate = self;
    segment.backgroundColor = [UIColor redColor];
    segment.selectIndex = 0;
    segment.lineHeight = 20;
    segment.radiuLabelType = radiuLabelTypeBottom;
    segment.radiuView.isRadius = YES;
    segment.radiuView.radiusHeight = 2;

    [self.chooseView addSubview:segment];
    
    
    _dataArr = [[NSMutableArray alloc] init];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"OrderFile"ofType:@"json"];
    
    //根据文件路径读取数据
    NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];
    
    
    //格式化成json数据
    NSMutableDictionary *dic= [NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingAllowFragments error:nil];
    
        [_dataArr addObjectsFromArray:[LZCourseModel mj_objectArrayWithKeyValuesArray:dic[@"data"]]];
    
    [_courseListTableView reloadData];
    
    
    
    
}

- (void)index:(NSInteger)index {
    
    _indexSelect = index;
    
    [_courseListTableView reloadData];
    

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_indexSelect == 2) {
        return 20;
    }
    
    return _dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_indexSelect == 2) {
        return 70;
    }
    
    return [LZCourseFirstCell tabViewCellHeight:_dataArr[indexPath.section]];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_indexSelect == 2) {
        LZCourseJudgeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZCourseJudgeCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZCourseJudgeCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        LZCourseFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZCourseFirstCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZCourseFirstCell" owner:self options:nil] lastObject];
        }
//        cell.model = _dataArr[indexPath.section];
        [cell setModel:_dataArr[indexPath.section] index:_indexSelect];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section % 2) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LZPayViewController" bundle:nil];
        LZPayViewController *wvc = [storyboard instantiateViewControllerWithIdentifier:@"LZPayViewController"];
        [self.navigationController pushViewController:wvc animated:YES];
    
    } else {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LZPayViewController" bundle:nil];
        LZPayViewController *wvc = [storyboard instantiateViewControllerWithIdentifier:@"LZJudgeController"];
        [self.navigationController pushViewController:wvc animated:YES];
    }
    


}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
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
