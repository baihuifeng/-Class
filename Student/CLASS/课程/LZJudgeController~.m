//
//  LZJudgeController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/23.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZJudgeController.h"

@interface LZJudgeController ()

@property (nonatomic,strong) UIView *backMarkView;
@property (nonatomic,strong) NSArray *markArr;
@property (nonatomic,copy) NSString *markScoreStr;

@end

@implementation LZJudgeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    [_markView addSubview:[self viewMarkWithScore:_markScoreStr]];
    
    
    
    
    
}

- (UIView *)viewMarkWithScore:(NSString *)scoreStr {
    
    if (!_backMarkView) {
        _backMarkView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _markView.frame.size.width, _markView.frame.size.height)];
        NSMutableArray *markMutableArr = [[NSMutableArray alloc] init];
        for (int i= 0; i<5; i++) {
            UIButton *scroeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [scroeBtn setTintColor:[UIColor clearColor]];
            scroeBtn.frame = CGRectMake(0.5+(i*12.5)+(i*5), 0.5, 12.5, 12.5);
            [scroeBtn setImage:[UIImage imageNamed:@"Nomark"] forState:UIControlStateNormal];//
            [scroeBtn setImage:[UIImage imageNamed:@"xiaolianicon"] forState:UIControlStateSelected];
            scroeBtn.tag = 101+i;
            [scroeBtn addTarget:self action:@selector(maekscore:) forControlEvents:UIControlEventTouchUpInside];
            [_backMarkView addSubview:scroeBtn];
            [markMutableArr addObject:scroeBtn];
        }
        
        _markArr = markMutableArr;
    }
    
    for (int i= 0; i<[scoreStr intValue]-1; i++) {
        
        UIButton *markSender = _markArr[i];
        
        markSender.selected = YES;
        
    }
    return _backMarkView;
    
}

- (void)maekscore:(UIButton *)sender {
    
    _markScoreStr = [NSString stringWithFormat:@"%d",(int)sender.tag-100];

    for (int i= 0; i<sender.tag-100; i++) {
        
        UIButton *markSender = _markArr[i];
        
        markSender.selected = YES;
        
    }
    
    NSLog(@"%d",(int)sender.tag-100);
    
    for (int i = (int)sender.tag-100; i<_markArr.count; i++) {
        UIButton *markSender = _markArr[i];
        
        markSender.selected = NO;
    }
     
    
    

    
    
    
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
