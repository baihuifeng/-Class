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
#import "LZYuYueModel.h"


@interface LZYuYueViewController () <UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>

@property (nonatomic,strong) NSArray *titleArr;

@property (nonatomic,strong) UIView *timeBackView;

@property (nonatomic,strong) UIDatePicker *datePicker;


@property (nonatomic,assign) int classCount;  //课时
@property (nonatomic,copy) NSString *classTime;//上课时间
@property (nonatomic,assign) int gradeIndex;

@property (nonatomic,strong) LZYuYueModel *yuyueModel;
@property (nonatomic,strong) ComeWithGoModel *ComeWithGomodel;


@end

@implementation LZYuYueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"预约";
    _classCount = 1;
    _classTime = @"";
    _gradeIndex = 0;
    _titleArr = @[@"授课时间",@"授课年级",@"选择科目",@"授课方式",@"购买课次",@"上课地址"];
    _yuyueTableView.tableHeaderView = [self tableViewHeaderView];
    
    JYAccount *infoModel = [JYAccountTool account];
    
    _yuyueModel = [[LZYuYueModel alloc] init];
    _ComeWithGomodel = [[ComeWithGoModel alloc] init];
    _yuyueModel.userId = infoModel.userId;
    _yuyueModel.teacherId = _detailModel.userID;
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 50;
    } else if (indexPath.section == 1) {
        return [LZYuYueGradeCell gradeNameArr:_grades];
    } else if (indexPath.section == 2) {
        return [LZYuYueGradeCell gradeNameArr:_skillsArr];
    }else if (indexPath.section == 3){
        return 60;
    } else if (indexPath.section == 4) {
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
        cell.filterResultBlock = ^(NSArray *gradeArr) {
//            weakSelf.gradeIndex = count;
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            for (GradesModel *grademodel in gradeArr) {
                [arr addObject:grademodel.gradeName];
            }
            weakSelf.yuyueModel.gradeName = arr;
            
        };
        [cell setDataArr:_detailModel.grades index:1];
        return cell;
    
    } else if (indexPath.section == 2) {
        LZYuYueGradeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZYuYueGradeCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZYuYueGradeCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        __weak typeof(self) weakSelf = self;
        cell.filterResultBlock = ^(NSArray *gradeArr) {
            //            weakSelf.gradeIndex = count;
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            for (GradesModel *grademodel in gradeArr) {
                [arr addObject:grademodel.name];
            }
            weakSelf.yuyueModel.skillName = arr;
            
        };
        [cell setDataArr:_detailModel.skills index:2];
        return cell;
    } else if (indexPath.section == 3) {
        LZYuYueGradeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZYuYueGradeCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZYuYueGradeCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        __weak typeof(self) weakSelf = self;
        cell.priceBlock = ^(int index) {
            weakSelf.ComeWithGomodel = weakSelf.detailModel.price.mode[index];
            weakSelf.yuyueModel.priceId = weakSelf.ComeWithGomodel.id;
            
            weakSelf.priceLabel.text = [NSString stringWithFormat:@"%@*%d",weakSelf.ComeWithGomodel.priceDescribe,weakSelf.classCount];
            [_yuyueTableView reloadData];
        };
        
        [cell setPriceModel:_detailModel.price index:0];
        return cell;
    } else if(indexPath.section == 4){
        LZYuYueCountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZYuYueCountCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZYuYueCountCell" owner:self options:nil] lastObject];
        }
        cell.countText.text = [NSString stringWithFormat:@"%d",_classCount];
        __weak typeof(self) weakSelf = self;
        cell.filterResultBlock = ^(int count) {
            weakSelf.classCount = count;
            weakSelf.yuyueModel.times = [NSString stringWithFormat:@"%d",count];
            weakSelf.priceLabel.text = [NSString stringWithFormat:@"%@*%d",weakSelf.ComeWithGomodel.priceDescribe,weakSelf.classCount];
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        LZYuYueAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZYuYueAddressCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZYuYueAddressCell" owner:self options:nil] lastObject];
        }
        cell.addressText.delegate = self;
        if (_ComeWithGomodel.id != nil) {
            cell.addressText.text = [_ComeWithGomodel.serviceName isEqualToString:@"学生上门"] ? _detailModel.price.studentAddress : _detailModel.price.teacherAddress;
        } else {
            cell.addressText.text = @"";
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

- (void)textViewDidEndEditing:(UITextView *)textView {
    
    _yuyueModel.address = textView.text;
    
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
    _yuyueModel.startTime = _classTime;
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

- (IBAction)yuyue:(UIButton *)sender {
    
    if (_yuyueModel.startTime.length == 0) {
        SWToast(@"请选择上课时间");
        return;
    }
    if (_yuyueModel.gradeName.count == 0) {
        SWToast(@"请选择年级");
        return;
    }
    if (_yuyueModel.skillName.count == 0) {
        SWToast(@"请选择科目");
        return;
    }
    
    if (_yuyueModel.priceId.length == 0) {
        SWToast(@"请选择上课方式");
        return;
    }
    
    
    if (_yuyueModel.address.length == 0) {
        SWToast(@"请输入地址");
        return;
    }
    
    
    NSDictionary *pram = _yuyueModel.mj_keyValues;
    
    
    
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
