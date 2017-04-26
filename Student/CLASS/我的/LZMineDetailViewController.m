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
#import "LZMineYXViewController.h"
#import "LZInfoGradeViewController.h"
#import "LZManagerChoose.h"
#import "JYImagePickerController.h"
#import "QIAOTextView.h"


@interface LZMineDetailViewController () <UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UIImageView *headImg;

@property (weak, nonatomic) IBOutlet UILabel *gradeName;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet QIAOTextView *address;

@property (weak, nonatomic) IBOutlet UILabel *regionName;

@property (strong, nonatomic) IBOutlet UITableViewCell *sexcell;
@property (weak, nonatomic) IBOutlet UITextField *cellPhone;

@property (strong,nonatomic) LQXSwitch *swit;

@property (weak, nonatomic) IBOutlet UITableViewCell *passwordCell;

@property (strong,nonatomic) LZInfoGradeViewController *gradeVc;

@property (nonatomic,strong) NSArray *imgArr;



@end

@implementation LZMineDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    _mineInfoTableView.tableFooterView = [[UIView alloc] init];
    
    [_sexcell.contentView addSubview:self.swit];
    [_headImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ManagerUrl,_model.headImgUrl]] placeholderImage:nil];
    _model.deviceId = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    _name.text = _model.nickName;
    _gradeName.text = _model.gradeName;
    _cellPhone.text = _model.cellPhone;
    _regionName.text = _model.regionName;
    _address.text = _model.address;

    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button1 addTarget:self action:@selector(saveInfo:)
      forControlEvents:UIControlEventTouchUpInside];
    button1.frame = CGRectMake(0, 0, 50, 44);
    button1.titleLabel.font = [UIFont systemFontOfSize:15.0];
    button1.titleLabel.textAlignment = NSTextAlignmentRight;
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *address = [[UIBarButtonItem alloc] initWithCustomView:button1];
    
    self.navigationItem.rightBarButtonItems = @[address];
    
    if (_comeApp==0) {
        _passwordCell.hidden = YES;
        [button1 setTitle:@"下一步" forState:UIControlStateNormal];
    } else {
        _passwordCell.hidden = NO;
        [button1 setTitle:@"保存" forState:UIControlStateNormal];
    }
 
}


- (void)saveInfo:(UIButton *)sender {
    
    NSLog(@"%@",_model);
    
    
    _model.nickName = _name.text;
    _model.address = _address.text;
    
    if ([sender.titleLabel.text isEqualToString:@"保存"]) {
    
        JYAccount *bianjiModel = [[JYAccount alloc] init];
        bianjiModel.userId = _model.userId;
        bianjiModel.nickName = _model.nickName;
        bianjiModel.regionCode = _model.regionCode;
        bianjiModel.gradeId = _model.gradeId;
        bianjiModel.gradeName = _model.gradeName;
        bianjiModel.sex = _model.sex;
        bianjiModel.expectSkills = _model.expectSkills;
        bianjiModel.headImgUrl = _model.headImgUrl;
        bianjiModel.gps = _model.gps;
        bianjiModel.address = _model.address;
        
        NSDictionary *parm = bianjiModel.mj_keyValues;
        
        NSLog(@"%@",parm);
        [Tool showHUDAddedTo:self.view animated:YES];
        [NetApiManager postToURL:LZEditInfoUrl bodyParams:parm finished:^(NetResponse *netResponse) {
           
            if (netResponse.isSuccess) {
                [NetApiManager getFromURL:[NSString stringWithFormat:@"%@userId=%@",LZInfoUrl,_model.userId] params:nil finished:^(NetResponse *netResponse) {
                    if (netResponse.isSuccess) {
                        JYAccount *infoAccount = [JYAccount mj_objectWithKeyValues:netResponse.responseObject[@"data"]];
                        [JYAccountTool save:infoAccount];

                            SWToast(@"编辑成功");
                        [Tool hideHUDForView:self.view animated:YES];
                            [self.navigationController popViewControllerAnimated:YES];
                            
                    }else {
                        SWToast(netResponse.errorMessage);
                        [Tool hideHUDForView:self.view animated:YES];
                    }
                }];
            
            } else {
                SWToast(netResponse.errorMessage);
                [Tool hideHUDForView:self.view animated:YES];
            }
            

        }];
        
    } else {
        LZMineYXViewController *yixian = [[LZMineYXViewController alloc] init];
        yixian.comeApp = ComeFirstApp;
        yixian.model = _model;
        [self.navigationController pushViewController:yixian animated:YES];
        
    }
    

}

//性别开关
- (LQXSwitch *)swit
{
    if (!_swit) {
        _swit = [[LQXSwitch alloc] initWithFrame:CGRectMake(kScreen_Width-85, 12.5, 50, 25) onColor:UICOLOR_RGB_Alpha(0x00cccc, 1)offColor:UICOLOR_RGB_Alpha(0xff6666, 1) font:JYSetFont ballSize:23];
        _swit.on = YES;
        _swit.on = [_model.sex isEqualToString:@"男"];
        
        _swit.onText = @"男";
        _swit.offText = @"女";
        [_swit addTarget:self action:@selector(switchSex:) forControlEvents:UIControlEventValueChanged];
    }
    NSLog(@"－1：女");
    
    return _swit;
}

- (void)switchSex:(LQXSwitch *)Isswitch {
    
    if (Isswitch.on) {
        _model.sex = @"男";
    } else {
        _model.sex = @"女";
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 10;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 2) {
            self.gradeVc.view.hidden = NO;
            [self.gradeVc setGradeName:_model.gradeName biaoshi:@"nianji"];
            
        } else if (indexPath.row == 5) {
            self.gradeVc.view.hidden = NO;
            [self.gradeVc setGradeName:_model.regionName biaoshi:@"quyu"];
        } else if (indexPath.row == 0) {
            [JYImagePickerController showMutliPickerInView:self.view maxImageCount:1 block:^(NSArray *imageArray) {
                _imgArr = imageArray;
                [self uploadImg];
                
            }];
        }
    }

}

- (void)uploadImg {

    [NetApiManager postToImgUrl:LZUpLoadImg parme:nil ImgArr:_imgArr finished:^(NetResponse *netResponse) {
        
        if (netResponse.isSuccess) {
            [_headImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ManagerUrl,netResponse.responseObject[@"data"]]] placeholderImage:nil];
            _model.headImgUrl = netResponse.responseObject[@"data"];
        } else {
            [self uploadImg];
        }
    }];
}

- (LZInfoGradeViewController *)gradeVc {
    
    if (!_gradeVc) {
        _gradeVc = [[LZInfoGradeViewController alloc] init];
        _gradeVc.view.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
        _gradeVc.view.hidden = YES;
        __weak typeof(self) weakSelf = self;
        
        _gradeVc.chooseModelBlock= ^(NSString *biaoshi, LZChooseModel *chooseModel) {
            weakSelf.gradeVc.view.hidden = YES;
            
            if ([biaoshi isEqualToString:@"nianji"]) {
                weakSelf.gradeName.text = chooseModel.name;
                weakSelf.model.gradeId = chooseModel.code;
                weakSelf.model.gradeName = chooseModel.name;
                
            } else {
                weakSelf.regionName.text = chooseModel.name;
                weakSelf.model.regionName = chooseModel.name;
                weakSelf.model.regionCode = chooseModel.code;
                
            }
            
        };

        [self.navigationController addChildViewController:_gradeVc];
        [self.navigationController.view addSubview:_gradeVc.view];
        
        
    }
    
    return _gradeVc;
}


- (void)setAddress:(QIAOTextView *)address {
    _address = address;
    _address.layer.cornerRadius = 4;
    _address.layer.borderWidth = 0.5;
    _address.layer.borderColor = UICOLOR_RGB_Alpha(0xeeeeee, 1.0).CGColor;
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
