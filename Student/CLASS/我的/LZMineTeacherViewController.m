//
//  LZMineTeacherViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/23.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZMineTeacherViewController.h"
#import "MineTeacherCell.h"

@interface LZMineTeacherViewController ()

@end

@implementation LZMineTeacherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的老师";
    SegmentView *segment = [[SegmentView alloc] initWithItmes:@[@"未上课",@"待支付",@"待评价",@"已完成"] WithFrame:CGRectMake(0, 0, kScreen_Width, 39) LabelType:radiuLabelTypeBottom];
    segment.delegate = self;
    segment.backgroundColor = [UIColor redColor];
    segment.selectIndex = 0;
    segment.lineHeight = 20;
    segment.radiuLabelType = radiuLabelTypeBottom;
    segment.radiuView.isRadius = YES;
    segment.radiuView.radiusHeight = 2;
    
    [self.mineSegment addSubview:segment];
    
    
    
}

- (void)index:(NSInteger)index {
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    

        return 70;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineTeacherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineTeacherCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MineTeacherCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

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
