//
//  LZBalancePayViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/4/7.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZBalancePayViewController.h"

@interface LZBalancePayViewController () <YBAttributeTapActionDelegate>

@end

@implementation LZBalancePayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.view.backgroundColor = UICOLOR_RGB_Alpha(0xebebeb, 1.0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc] init];
    
    view.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [[UILabel alloc] init];
//    label.text = @"温馨提示：\n\n提现时间：每周二09:00-18:00\n\n提现次数：一天一次，一次最多一万元人民币\n\n提现后1-2个工作日内汇入您的银行卡\n\n若卡片信息有误，请拨打24小时服务热线400-888-666\n\n我们会尽快帮您解决";
        NSString *str = @"温馨提示：\n\n提现时间：每周二09:00-18:00\n\n提现次数：一天一次，一次最多一万元人民币\n\n提现后1-2个工作日内汇入您的银行卡\n\n若卡片信息有误，请拨打24小时服务热线400-888-666\n\n我们会尽快帮您解决";
//    NSString *str1 = @"400-888-666\n\n我们会尽快帮您解决";
    
//    [label yb_addAttributeTapActionWithStrings:@[@"400-888-666"] delegate:self];
    label.numberOfLines = 0;
    label.textColor = UICOLOR_RGB_Alpha(0x696969, 1.0);
    label.font = [UIFont systemFontOfSize:13.0];
    label.textAlignment = NSTextAlignmentLeft;
    
    label.attributedText  = [self attribuedStrring:str Range:NSMakeRange(89, 11) color:[UIColor redColor]];
    label.frame = CGRectMake(13, 10, kScreen_Width-26, [NSString stringSizeWithString:label.text maxSize:CGSizeMake(kScreen_Width-26, CGFLOAT_MAX) wordFont:13].height);
    label.lineBreakMode = NSLineBreakByCharWrapping;
    
    [label yb_addAttributeTapActionWithStrings:@[@"400-888-666"] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        
        NSLog(@"11111");
    }];
    
    
    
    [view addSubview:label];

    view.frame = CGRectMake(0, 0, kScreen_Width, label.frame.size.height+100);
    UIButton *balanceBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    balanceBtn.frame = CGRectMake((kScreen_Width-281)/2, CGRectGetMaxY(label.frame)+50, 281, 35);
    [balanceBtn setTitle:@"提现" forState:UIControlStateNormal];
    [balanceBtn setBackgroundColor:UICOLOR_RGB_Alpha(0x23cd77, 1.0)];
    [balanceBtn setTintColor:[UIColor clearColor]];
    [balanceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    balanceBtn.layer.cornerRadius = 5;
    [view addSubview:balanceBtn];

    return view;

}

- (void)yb_attributeTapReturnString:(NSString *)string range:(NSRange)range index:(NSInteger)index
{

    NSLog(@"11111");
}

- (NSAttributedString *)attribuedStrring:(NSString *)strring Range:(NSRange)range color:(UIColor *)color {
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:strring];
    [AttributedStr addAttribute:NSForegroundColorAttributeName
     
                          value:color
     
                          range:range];
    
    
    return AttributedStr;
}




- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    NSString *str = @"温馨提示：\n\n提现时间：每周二09:00-18:00\n\n提现次数：一天一次，一次最多一万元人民币\n\n提现后1-2个工作日内汇入您的银行卡\n\n若卡片信息有误，请拨打24小时服务热线400-888-666\n\n我们会尽快帮您解决";
    return 100+[NSString stringSizeWithString:str maxSize:CGSizeMake(kScreen_Width-26, CGFLOAT_MAX) wordFont:13].height;
    

}

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
