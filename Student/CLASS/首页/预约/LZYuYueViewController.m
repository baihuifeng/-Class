//
//  LZYuYueViewController.m
//  Student
//
//  Created by 白慧峰 on 2017/4/18.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZYuYueViewController.h"
#import "LZDetailModel.h"
#import "LZYuYueGradeCell.h"
#import "LZYuYueCountCell.h"
#import "LZYuYueAddressCell.h"

@interface LZYuYueViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *titleArr;

@property (nonatomic,strong) UIView *timeBackView;

@property (nonatomic,strong) UIDatePicker *datePicker;


@property (nonatomic,assign) int classCount;  //课时
@property (nonatomic,copy) NSString *classTime;//上课时间
@property (nonatomic,assign) int gradeIndex;


@end

@implementation LZYuYueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"预约";
    _classCount = 1;
    _classTime = @"";
    _gradeIndex = 0;
    _titleArr = @[@"授课时间",@"授课年级",@"授课方式",@"购买课次",@"上课地址"];
    _yuyueTableView.tableHeaderView = [self tableViewHeaderView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (_dataArr.count == 0) {
        return 0;
    }
    
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 50;
    } else if (indexPath.section == 1) {
        return [LZYuYueGradeCell gradeNameArr:_dataArr];
    } else if (indexPath.section == 2){
        return 60;
    } else if (indexPath.section == 3) {
        return 44;
    }
    
    return 124;

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        LZYuYueTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZYuYueTimeCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZYuYueTimeCell" owner:self options:nil] lastObject];
        }
        cell.timeLabel.text = _classTime;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.section == 1) {
        LZYuYueGradeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZYuYueGradeCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZYuYueGradeCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        __weak typeof(self) weakSelf = self;
        cell.filterResultBlock = ^(int count) {
            weakSelf.gradeIndex = count;
            [_yuyueTableView reloadData];
        };
        [cell setDataArr:_dataArr index:_gradeIndex];
        return cell;
    
    } else if (indexPath.section == 2) {
        LZYuYueGradeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZYuYueGradeCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZYuYueGradeCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setPriceModel:_dataArr[_gradeIndex] index:0];
        return cell;
    } else if(indexPath.section == 3){
        LZYuYueCountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZYuYueCountCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZYuYueCountCell" owner:self options:nil] lastObject];
        }
        cell.countText.text = [NSString stringWithFormat:@"%d",_classCount];
        __weak typeof(self) weakSelf = self;
        cell.filterResultBlock = ^(int count) {
            weakSelf.classCount = count;
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        LZYuYueAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZYuYueAddressCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZYuYueAddressCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 40)];
    view.backgroundColor = UICOLOR_RGB_Alpha(0Xffffff, 1.0);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(13, 0, 200, 40)];
    label.textColor = UICOLOR_RGB_Alpha(0XA2A3A2, 1.0);
    label.font = [UIFont systemFontOfSize:14.0];
    [view addSubview:label];
    label.text = _titleArr[section];
    return view;
}

- (UIView *)tableViewHeaderView {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 80)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"choose_time_icon"] forState:UIControlStateNormal];
    [button setTitle:@"选择首次上课时间" forState:UIControlStateNormal];
    [button setTitleColor:UICOLOR_RGB_Alpha(0XF5A623, 1.0) forState:UIControlStateNormal];
    button.frame = CGRectMake(kScreen_Width/2-(kScreen_Width-150)/2, 20, kScreen_Width-150, 36);
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = UICOLOR_RGB_Alpha(0XF5A623, 1.0).CGColor;
    button.titleLabel.font = [UIFont systemFontOfSize:15.0];
    button.layer.cornerRadius = 4;
    [button addTarget:self action:@selector(timeAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    return view;
}

- (void)timeAction:(UIButton *)sender {
    self.timeBackView.hidden = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
       
        CGRect rect = self.datePicker.frame;
        
        rect.origin.y = kScreen_Height/2;
        
        self.datePicker.frame = rect;

    }];
}


- (void)hiddenView {
    self.timeBackView.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect rect = self.datePicker.frame;
        
        rect.origin.y = kScreen_Height;
        
        self.datePicker.frame = rect;
        
    }];
    
    _classTime = [self dataStr:_datePicker.date];
    NSIndexPath *tmpIndexpath=[NSIndexPath indexPathForRow:0 inSection:0];
    [_yuyueTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:tmpIndexpath, nil] withRowAnimation:UITableViewRowAnimationFade];

}



- (UIView *)timeBackView {
    
    if (!_timeBackView) {
        _timeBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
        _timeBackView.hidden = YES;
        _timeBackView.backgroundColor = UICOLOR_RGB_Alpha(0X000000, 0.25);
        [_timeBackView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenView)]];
        [self.view addSubview:_timeBackView];
    }
    
    return _timeBackView;
    
}

- (UIDatePicker *)datePicker {
    
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, kScreen_Height, kScreen_Width, kScreen_Height/2)];
        _datePicker.backgroundColor = UICOLOR_RGB_Alpha(0XFFFFFF, 1.0);
        _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        _datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        
        [self.view addSubview:_datePicker];
    }
    
    return _datePicker;
}

- (NSString *)dataStr:(NSDate *)date {
    NSString *strDate;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    strDate = [dateFormatter stringFromDate:date];
    return strDate;
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
