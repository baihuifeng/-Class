//
//  LZMineDetailViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/23.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZMineDetailViewController.h"
#import "LZMineDetailModel.h"
#import "LQXSwitch.h"

@interface LZMineDetailViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *gradeName;

@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UILabel *cellPhone;
@property (weak, nonatomic) IBOutlet UILabel *regionName;

@property (strong, nonatomic) IBOutlet UITableViewCell *sexcell;

@property (strong,nonatomic) LQXSwitch *swit;



@property (nonatomic,strong) LZMineDetailModel *model;
@end

@implementation LZMineDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    _mineInfoTableView.tableFooterView = [[UIView alloc] init];
    
    [_sexcell.contentView addSubview:self.swit];
    
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"MineFile"ofType:@"json"];
    
    //根据文件路径读取数据
    NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];
    
    
    //格式化成json数据
    NSMutableDictionary *dic= [NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingAllowFragments error:nil];
    _model = [LZMineDetailModel mj_objectWithKeyValues:dic[@"data"]];
    
    self.name.text = _model.name;
    self.gradeName.text = _model.gradeName;
    self.cellPhone.text = _model.cellPhone;
    self.sex.text = _model.sex;
    self.regionName.text = _model.regionName;
    
    

    
}

//性别开关
- (LQXSwitch *)swit
{
    if (!_swit) {
        _swit = [[LQXSwitch alloc] initWithFrame:CGRectMake(kScreen_Width-85, 12.5, 50, 25) onColor:UICOLOR_RGB_Alpha(0x00cccc, 1)offColor:UICOLOR_RGB_Alpha(0xff6666, 1) font:JYSetFont ballSize:23];
        
        _swit.on = [_model.sex isEqualToString:@"0"];
        
        _swit.onText = @"男";
        _swit.offText = @"女";
        [_swit addTarget:self action:@selector(switchSex:) forControlEvents:UIControlEventValueChanged];
    }
    NSLog(@"－1：女");
    
    return _swit;
}

- (void)switchSex:(LQXSwitch *)Isswitch {
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 10;
    }
    
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
