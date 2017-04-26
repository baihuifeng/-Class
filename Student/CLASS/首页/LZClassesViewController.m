//
//  LZClassesViewController.m
//  Student
//
//  Created by 葬花桥 on 2017/3/21.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZClassesViewController.h"
#import "LZClassesItmesCell.h"
#import "LZTeacherDetailViewController.h"
#import "LZDetailStandardView.h"
#import "LZClassListHeadView.h"
#import "LZClassItmeListView.h"
#import "PullView.h"
#import "LZChooseViewController.h"
#import "LZManagerChoose.h"
#import "LZTeacherListCell.h"

@interface LZClassesViewController ()

@property (nonatomic,strong) NSMutableArray *dataArr;

@property (nonatomic,strong) PullView *pullView;

@property (nonatomic,strong) LZChooseViewController *chooseVc;

@property (nonatomic,assign) int buttonIndex;

@property (nonatomic,strong) LZClassListHeadView *headView;

@property (nonatomic,strong) NSMutableArray *itmeArr;

@property (nonatomic,assign) int row;


@property (nonatomic,assign) int sortIndex;//排序

@property (nonatomic,assign) int gradeIndex;//年级

@property (nonatomic,assign) int regionIndex;//区域

@property (nonatomic,strong) NSMutableArray *chooseIndexArr;

@property (nonatomic,strong) NSArray *moreArr;

@property (nonatomic,strong) LZClassItmeListView *lzClassView;

#pragma -mark "总科目筛选"

@property (nonatomic,strong) UITableView *KeMuTableView;
@property (nonatomic,strong) UIView *keMuBackView;
@property (nonatomic,strong) NSArray *kemuArr;
@property (nonatomic,strong) UIButton *kemuButton;



@end

@implementation LZClassesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    if (_titleModel.tagTitle== nil) {
        _titleModel = _listModel.skills[0];
    }
    
    
    _kemuButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_kemuButton setTitle:_titleModel.tagTitle forState:UIControlStateNormal];
    [_kemuButton setTitleColor:UICOLOR_RGB_Alpha(0xffffff, 1.0) forState:UIControlStateNormal];
    [_kemuButton addTarget:self action:@selector(chooseList:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = _kemuButton;
    
    [self.view addSubview:self.keMuBackView];
    [self.view addSubview:self.KeMuTableView];
    
    
    
    
    _chooseIndexArr = [NSMutableArray arrayWithObjects:@0,@0,@0,@0, nil];
    _moreArr = @[@0,@0,@0];
    
    [self.chooseVc dataArr:[LZManagerChoose getSequenceCondition] selectedIndex:[_chooseIndexArr[0] intValue]];
    
    _classesListTableView.tableFooterView = [[UIView alloc]init];
    
    _lzClassView = [[LZClassItmeListView alloc] init];
    _lzClassView.frame = CGRectMake(0, 0, kScreen_Width, 0);
    _lzClassView.backgroundColor = [UIColor redColor];
    
    [_classesListTableView addSubview:_lzClassView];
    
    
    
    
    _dataArr = [[NSMutableArray alloc] init];
    _itmeArr = [[NSMutableArray alloc] init];
    
    JYAccount *infoModel = [JYAccountTool account];
    
    [NetApiManager getFromURL:[NSString stringWithFormat:@"%@userId=%@&parentId=%@",LZGetSubject,infoModel.userId,_parentId] params:nil finished:^(NetResponse *netResponse) {
        
        if (netResponse.isSuccess) {
            [_itmeArr addObjectsFromArray:[SkillsModel mj_objectArrayWithKeyValuesArray:netResponse.responseObject[@"data"]]];
            

            [self collectionHeight:_itmeArr];
            
            _lzClassView.itmeArr = _itmeArr;
            
            [NetApiManager getFromURL:[NSString stringWithFormat:@"%@",LZTeacherList] params:nil finished:^(NetResponse *netResponse) {
                
                [_dataArr addObjectsFromArray:[ListModel mj_objectArrayWithKeyValuesArray:netResponse.responseObject[@"data"]]];
                
                [_classesListTableView reloadData];
            }];

            
            
        }
        
        
        
    }];
    
}

- (void)chooseList:(UIButton *)sender {
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (SkillsModel *model in _listModel.skills) {
        if (![_titleModel.tagTitle isEqualToString:model.tagTitle]) {
            [arr addObject:model];
        }
    }

    _kemuArr = arr;
    _KeMuTableView.hidden = NO;
    _keMuBackView.hidden = NO;
    
    [_KeMuTableView reloadData];
   
}

- (UIView *)keMuBackView {
    
    if (_keMuBackView == nil) {
        _keMuBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
        _keMuBackView.backgroundColor = UICOLOR_RGB_Alpha(0x000000, 0.25);
        _keMuBackView.hidden = YES;
        [_keMuBackView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenBackView)]];
        
    }
    
    return _keMuBackView;
    
}

- (void)hiddenBackView {
    _keMuBackView.hidden = YES;
    _KeMuTableView.hidden = YES;
}

- (UITableView *)KeMuTableView {
    if (_KeMuTableView == nil) {
        _KeMuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height/3) style:UITableViewStylePlain];
        _KeMuTableView.delegate = self;
        _KeMuTableView.dataSource = self;
        _KeMuTableView.hidden = YES;
        _KeMuTableView.tableFooterView = [[UIView alloc] init];
        _KeMuTableView.separatorColor = UICOLOR_RGB_Alpha(0xeeeeee, 1.0);
        _KeMuTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    return _KeMuTableView;

}

- (void)collectionHeight:(NSArray *)itmeArr {

//    int row;
    if (_itmeArr.count % 3 == 0) {
        _row = (int)_itmeArr.count/3;
    } else {
        _row = (int)_itmeArr.count/3 + 1;
    }
    
    CGRect collectionfram = _lzClassView.frame;
    collectionfram.origin.y = -80*_row;
    collectionfram.size.height = 80*_row;
    _lzClassView.frame = collectionfram;
    
//    dispatch_async(dispatch_get_main_queue(), ^{
        _classesListTableView.contentOffset = CGPointMake(0, -80*_row);
        _classesListTableView.contentInset = UIEdgeInsetsMake(80*_row, 0, 0, 0);
//    });
    
    
}



#pragma -mark tableViewViewdelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (_KeMuTableView == tableView) {
        return _kemuArr.count;
    }
    

    return _dataArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_KeMuTableView == tableView) {
        return 44;
    }

    return 105;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _KeMuTableView) {
        static NSString *str = @"qqq";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        SkillsModel *mdoel = _kemuArr[indexPath.row];
        
        cell.textLabel.text = mdoel.tagTitle;
        cell.textLabel.font = [UIFont systemFontOfSize:13.0];
        cell.textLabel.textColor = UICOLOR_RGB_Alpha(0x6a6a6a, 1);
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
        return cell;
    }
    

    LZTeacherListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZTeacherListCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LZTeacherListCell" owner:self options:nil] lastObject];
    }
    cell.model = _dataArr[indexPath.row];

    return cell;
    
    


    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _KeMuTableView) {
        SkillsModel *mdoel = _kemuArr[indexPath.row];
        _titleModel = mdoel;
        _KeMuTableView.hidden = YES;
        _keMuBackView.hidden = YES;
        [_kemuButton setTitle:mdoel.tagTitle forState:UIControlStateNormal];
        
    } else {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        ListModel *model = _dataArr[indexPath.row];
        LZTeacherDetailViewController *detailVc = [[LZTeacherDetailViewController alloc] init];
        detailVc.teacherId = model.userID;
        [self.navigationController pushViewController:detailVc animated:YES];
    }

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView != _KeMuTableView) {
        _headView = [[LZClassListHeadView alloc] init];
        _headView.frame = CGRectMake(0, 0, kScreen_Width, 40);
        __weak typeof(self) weakSelf = self;
        _headView.filterResultBlock = ^(NSInteger index) {
            _buttonIndex = (int)index;
            
            [weakSelf.classesListTableView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
            [UIView animateWithDuration:0.3 animations:^{
                weakSelf.chooseVc.view.hidden = NO;
                if (index == 0) {
                    [weakSelf.chooseVc dataArr:[LZManagerChoose getSequenceCondition] selectedIndex:[weakSelf.chooseIndexArr[index] intValue]];
                } else if (index == 1) {
                    [weakSelf.chooseVc dataArr:[LZManagerChoose getgardeCondition] selectedIndex:[weakSelf.chooseIndexArr[index] intValue]];
                } else if (index == 2) {
                    [weakSelf.chooseVc dataArr:[LZManagerChoose getRegionCondition] selectedIndex:[weakSelf.chooseIndexArr[index] intValue]];
                } else if (index == 3) {
                    [weakSelf.chooseVc moreViewIndex:(int)index];
                }
                
            }];
            
        };
        return _headView;
    }

    return nil;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (tableView == _KeMuTableView) {
        return 0;
    }

        return 40;

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView != (UIScrollView *)_KeMuTableView) {
        NSLog(@"1111    f = %f",-scrollView.contentOffset.y);
        
        if (-scrollView.contentOffset.y <= 0) {
            _classesListTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            return;
        } else if (-scrollView.contentOffset.y >= 80*_row) {
            _classesListTableView.contentInset = UIEdgeInsetsMake(80*_row, 0, 0, 0);
        } else {
            _classesListTableView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        }
    }


 
}


- (LZChooseViewController *)chooseVc {
    
    if (!_chooseVc) {
        _chooseVc = [[LZChooseViewController alloc] init];
        _chooseVc.view.frame = CGRectMake(0, 40, kScreen_Width, kScreen_Height);
        _chooseVc.view.hidden = YES;
        __weak typeof(self) weakSelf = self;
        _chooseVc.rowBlock = ^(NSInteger rowIndex,NSArray *moreArr) {
            
            [weakSelf.chooseIndexArr replaceObjectAtIndex:weakSelf.buttonIndex withObject:@(rowIndex)];
            weakSelf.chooseVc.view.hidden = YES;
            for (UIButton *btn in weakSelf.headView.buttonArr) {
                btn.selected = NO;
            }
            weakSelf.moreArr = moreArr;
            
            NSLog(@"-------=======>>>>%@,%@",weakSelf.chooseIndexArr,weakSelf.moreArr);
        };
        [self addChildViewController:_chooseVc];
        [self.view addSubview:_chooseVc.view];
        
        
    }
    
    return _chooseVc;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
