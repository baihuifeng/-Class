//
//  LZChooseViewController.m
//  Student
//
//  Created by 白慧峰 on 2017/4/19.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZChooseViewController.h"
#import "LZManagerChoose.h"

@interface LZChooseViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *dataArr;

@property (nonatomic,assign) int rowSelected;

@property (nonatomic,copy) NSString *biaoshi;

@property (nonatomic,strong) NSArray *headTitle;

@property (nonatomic,strong) UIButton *centerBtn;


@property (strong, nonatomic) IBOutlet UIView *backView;

@end

@implementation LZChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _headTitle = @[@"性别",@"教龄",@"其他"];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 0) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _tableView.separatorColor = UICOLOR_RGB_Alpha(0Xeeeeee, 1.0);
    [self.view addSubview:_tableView];
    
    [_backView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenView)]];
  
}

- (void)hiddenView {
    if ([_biaoshi isEqualToString:@"nomal"]) {
        if (self.rowBlock) {
            self.rowBlock(_rowSelected);
        }
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([_biaoshi isEqualToString:@"nomal"]) {
        return 1;
    } else {
        
        if (section == 0) {
           return [LZManagerChoose getSexCondition].count;
        } else if (section == 1) {
            return [LZManagerChoose getServiceCondition].count;
            
        } else {
            return [LZManagerChoose getOtherCondition].count;
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([_biaoshi isEqualToString:@"nomal"]) {
        return _dataArr.count;
    }
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([_biaoshi isEqualToString:@"nomal"]) {
        static NSString *str = @"qqq";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        LZChooseModel *model = _dataArr[indexPath.section];
        cell.textLabel.text = model.name;
        cell.textLabel.textColor = _rowSelected == indexPath.section ? UICOLOR_RGB_Alpha(0X23CD77, 1.0): UICOLOR_RGB_Alpha(0X666666, 1.0);
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.font = [UIFont systemFontOfSize:15.0];
        return cell;
    } else {
        static NSString *str = @"qqq";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        LZChooseModel *model =nil;
        
        if (indexPath.section == 0) {
            model = [LZManagerChoose getSexCondition][indexPath.row];
        } else if (indexPath.section == 1) {
            model = [LZManagerChoose getServiceCondition][indexPath.row];
        } else {
            model = [LZManagerChoose getOtherCondition][indexPath.row];
        }
        
        cell.textLabel.text = model.name;
        cell.textLabel.textColor = _rowSelected == indexPath.row ? UICOLOR_RGB_Alpha(0X23CD77, 1.0): UICOLOR_RGB_Alpha(0X666666, 1.0);
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.font = [UIFont systemFontOfSize:15.0];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (![_biaoshi isEqualToString:@"nomal"]) {
        return 40;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (![_biaoshi isEqualToString:@"nomal"]) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 40)];
        view.backgroundColor = UICOLOR_RGB_Alpha(0Xffffff, 1.0);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(13, 0, 200, 40)];
        label.textColor = UICOLOR_RGB_Alpha(0XA2A3A2, 1.0);
        label.font = [UIFont systemFontOfSize:14.0];
        [view addSubview:label];
        label.text = _headTitle[section];
        return view;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([_biaoshi isEqualToString:@"nomal"]) {
        if (self.rowBlock) {
            _rowSelected = (int)indexPath.section;
            self.rowBlock(indexPath.section);
        }
    }
    
    
}

- (void)dataArr:(NSArray *)dataArr selectedIndex:(int)selectedIndex {

    _biaoshi = @"nomal";
    
//    [UIView animateWithDuration:0.3 animations:^{
        CGRect tabRect = _tableView.frame;
        tabRect.size.height = dataArr.count *40;
        _tableView.frame = tabRect;
//    }];
    _dataArr = dataArr;
    _rowSelected = selectedIndex;
    [_tableView reloadData];
    self.centerBtn.hidden = YES;

}

- (void)moreViewIndex:(int)index {
    _biaoshi = @"other";
    if (index == 3) {
        
        CGRect tabRect = _tableView.frame;
        tabRect.size.height = kScreen_Height/2;
        _tableView.frame = tabRect;
        [_tableView reloadData];
        self.centerBtn.hidden = NO;
    }
    
}

- (UIButton *)centerBtn {
    
    if (!_centerBtn) {
        _centerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _centerBtn.frame = CGRectMake(0, kScreen_Height/2, kScreen_Width, 40);
        [_centerBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_centerBtn setTitleColor:UICOLOR_RGB_Alpha(0X333333, 1.0) forState:UIControlStateNormal];
        _centerBtn.tintColor = [UIColor clearColor];
        [_centerBtn setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:_centerBtn];
    }
    
    return _centerBtn;
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
