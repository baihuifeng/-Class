//
//  LZYaJingViewController.m
//  Student
//
//  Created by 白慧峰 on 2017/4/26.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZYaJingViewController.h"
#import "LZYaJinTeleTestCell.h"
#import "LZYaJinSinMingCell.h"
#import "LZYaJinJineCell.h"
#import "LZYajinFinishCell.h"

@interface LZYaJingViewController () <UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UIButton *teleTest;
@property (weak, nonatomic) IBOutlet UIView *firstView;

@property (weak, nonatomic) IBOutlet UIButton *nameTest;

@property (weak, nonatomic) IBOutlet UIView *secondView;

@property (weak, nonatomic) IBOutlet UIButton *yajinTest;

@property (weak, nonatomic) IBOutlet UIView *thirdView;

@property (weak, nonatomic) IBOutlet UIButton *finish;



@property (nonatomic,copy) NSString *titltStr;

@property (nonatomic,strong) UIButton *button;

@end

@implementation LZYaJingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _yajinTableView.tableFooterView = [[UIView alloc] init];
    
    _titltStr = @"验证手机";
    
    self.title = _titltStr;
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if ([_titltStr isEqualToString:@"验证手机"]) {

        return 128;
    } else if ([_titltStr isEqualToString:@"实名认证"]) {
        return 270;
    } else if ([_titltStr isEqualToString:@"充值"]) {
        return 207;
    } else {
        return 251;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([_titltStr isEqualToString:@"验证手机"]) {
        LZYaJinTeleTestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZYaJinTeleTestCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZYaJinTeleTestCell" owner:self options:nil] lastObject];
        }
        
        return cell;
    } else if ([_titltStr isEqualToString:@"实名认证"]) {
        LZYaJinSinMingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZYaJinSinMingCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZYaJinSinMingCell" owner:self options:nil] lastObject];
        }
        
        return cell;
    } else if ([_titltStr isEqualToString:@"充值"]) {
        LZYaJinJineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZYaJinJineCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZYaJinJineCell" owner:self options:nil] lastObject];
        }
        
        return cell;
    } else {
        LZYajinFinishCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZYajinFinishCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZYajinFinishCell" owner:self options:nil] lastObject];
        }
        
        return cell;
    }
    

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return 70;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 70)];
    
    _button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    _button.frame = CGRectMake(10, 20, kScreen_Width-20, 40);
    
    [_button setTitle:_titltStr forState:UIControlStateNormal];
    
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [_button setBackgroundColor:UICOLOR_RGB_Alpha(0X23cd77, 1.0)];
    
    _button.titleLabel.font = [UIFont systemFontOfSize:15.0];
    
    [_button addTarget:self action:@selector(nextYanZheng:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_button];
    return view;
    
}

- (void)nextYanZheng:(UIButton *)sender {
    
    if ([sender.titleLabel.text isEqualToString:@"验证手机"]) {
        _titltStr = @"实名认证";
        self.title = _titltStr;
        [_button setTitle:@"认证" forState:UIControlStateNormal];
        _teleTest.selected = YES;
        _firstView.backgroundColor = UICOLOR_RGB_Alpha(0X23cd77, 1.0);
        
        
        
    } else if ([sender.titleLabel.text isEqualToString:@"实名认证"]) {
        _titltStr = @"充值";
        self.title = _titltStr;
        [_button setTitle:@"押金充值" forState:UIControlStateNormal];
        _nameTest.selected = YES;
        _secondView.backgroundColor = UICOLOR_RGB_Alpha(0X23cd77, 1.0);
    
    } else if ([sender.titleLabel.text isEqualToString:@"充值"]) {
        _titltStr = @"认证完成";
        self.title = _titltStr;
        [_button setTitle:@"完成" forState:UIControlStateNormal];
        _yajinTest.selected = YES;
        _thirdView.backgroundColor = UICOLOR_RGB_Alpha(0X23cd77, 1.0);
    } else if ([sender.titleLabel.text isEqualToString:@"认证完成"]) {
        _finish.selected = YES;
    }
    
    [_yajinTableView reloadData];
    
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
