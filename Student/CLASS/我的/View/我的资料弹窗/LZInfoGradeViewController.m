//
//  LZInfoGradeViewController.m
//  Student
//
//  Created by 白慧峰 on 2017/4/24.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZInfoGradeViewController.h"
#import "LZManagerChoose.h"
#import "LZChooseExpectSkillCell.h"

@interface LZInfoGradeViewController () <UITableViewDelegate,UITableViewDataSource,ChooseSubjectDelegate>

@property (nonatomic,strong) NSMutableArray *dataArr;
@property (weak, nonatomic) IBOutlet UIButton *quedin;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *biaoshi;

@property (nonatomic,strong) NSArray *subjectArr;

@property (nonatomic,strong) NSMutableArray *chooseSubjectMutableArr;

@end

@implementation LZInfoGradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)setGradeName:(NSString *)name biaoshi:(NSString *)biaoshi {
    _biaoshi = biaoshi;
    _name = name;
    _dataArr = [[NSMutableArray alloc] init];
    _chooseSubjectMutableArr = [[NSMutableArray alloc] init];

    if ([biaoshi isEqualToString:@"nianji"]) {
//        getgardeCondition
        _titleLabel.text = @"选择年级";
//        _dataArr = [[LZCommonManager shareInstance]gradeArrInfo];
        [_dataArr addObjectsFromArray:[[LZCommonManager shareInstance]gradeArrInfo]];
        
//        [NetApiManager getFromURL:LZGradeInfo params:nil finished:^(NetResponse *netResponse) {
//            
//            for (NSDictionary *grade in netResponse.responseObject[@"data"]) {
//                
//                LZChooseModel *model = [[LZChooseModel alloc] init];
//                model.name = grade[@"gradeName"];
//                model.code = grade[@"id"];
//                
//                [_dataArr addObject:model];
//                
//            }
//            
            [_tableView reloadData];
//        }];
        
        
    } else if ([biaoshi isEqualToString:@"quyu"]){
        _titleLabel.text = @"选择区域";
        [NetApiManager getFromURL:LZRegion params:nil finished:^(NetResponse *netResponse) {

            [_dataArr addObjectsFromArray:[LZChooseModel mj_objectArrayWithKeyValuesArray:netResponse.responseObject[@"data"]]];


            
            [_tableView reloadData];
        }];
    } else {
        _titleLabel.text = @"选择科目";
        
        
        
        _quedin.hidden = NO;
        _subjectArr = [name componentsSeparatedByString:@" "];
        [_chooseSubjectMutableArr addObjectsFromArray:_subjectArr];
        [NetApiManager getFromURL:LZGetSubject params:nil finished:^(NetResponse *netResponse) {
            
            [_dataArr addObjectsFromArray:[SkillsModel mj_objectArrayWithKeyValuesArray:netResponse.responseObject[@"data"]]];
            
            [_tableView reloadData];
        }];
    
    }
    
    [_tableView reloadData];
 
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {


    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {


    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([_biaoshi isEqualToString:@"yixiang"]) {
        
        LZChooseExpectSkillCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZChooseExpectSkillCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LZChooseExpectSkillCell" owner:self options:nil] lastObject];
        }
        SkillsModel *model = _dataArr[indexPath.row];
        cell.titleContent.text = model.tagTitle;
        cell.delegate = self;
        cell.indexPath = indexPath;
        
        for (NSString *str in _subjectArr) {
            if ([str isEqualToString:model.tagTitle]) {
                cell.chooseSender.selected = YES;
                break;
            } else {
                cell.chooseSender.selected = NO;
            }
        }
        
        
        return cell;
        
    } else {
        static NSString *str = @"qqq";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        LZChooseModel *model = _dataArr[indexPath.row];
        cell.textLabel.text = model.name;
        
        
        
        cell.textLabel.textColor = [_name isEqualToString:model.name] ? UICOLOR_RGB_Alpha(0X23CD77, 1.0): UICOLOR_RGB_Alpha(0X666666, 1.0);
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.font = [UIFont systemFontOfSize:15.0];
        return cell;
    }
    
}

- (void)chooseSubjectDelegate:(LZChooseExpectSkillCell *)cell {
    SkillsModel *model = _dataArr[cell.indexPath.row];
    if (cell.chooseSender.selected == YES) {
        
        [_chooseSubjectMutableArr addObject:model.tagTitle];
        
    } else {
    
        for (NSString *titlestr in _chooseSubjectMutableArr) {
            if ([model.tagTitle isEqualToString:titlestr]) {
                [_chooseSubjectMutableArr removeObject:titlestr];
            }
        }
    }
    
    

}
- (IBAction)queding:(UIButton *)sender {
//    TagsInfoModel
    
    NSMutableArray *chooseTag = [[NSMutableArray alloc] init];
    for (int i = 0; i<_dataArr.count; i++) {
        SkillsModel *model = _dataArr[i];
        
        for (NSString *str in _chooseSubjectMutableArr) {
            if ([str isEqualToString:model.tagTitle]) {
//                TagsInfoModel *tagModel = [[TagsInfoModel alloc] init];
//                tagModel.id = model.id;
//                tagModel.name = model.tagTitle;
                
                NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
                [dic setObject:model.id forKey:@"id"];
                [dic setObject:model.tagTitle forKey:@"name"];
                [chooseTag addObject:dic];
            }
        }
        
    }
    
    if (self.chooseSubjectModelBlock) {
        self.chooseSubjectModelBlock(chooseTag);
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.chooseModelBlock) {
        self.chooseModelBlock(_biaoshi, _dataArr[indexPath.row]);
        
    }
    
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
