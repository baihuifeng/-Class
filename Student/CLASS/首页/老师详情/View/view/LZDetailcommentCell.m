//
//  LZDetailcommentCell.m
//  Student
//
//  Created by bai on 2017/3/22.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZDetailcommentCell.h"
#import "LZDetaiCellHeadView.h"

@implementation LZDetailcommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}


- (void)setCaseIndex:(int)caseIndex detailModel:(LZDetailModel *)model {
    _caseIndex = caseIndex;
    _model = model;
    
    if (caseIndex == 1001) {
        _headImg.image = [UIImage imageNamed:@"DetailPingLunIcon"];
        _headContent.text = @"学生评论";
        _headCount.hidden = NO;
        [_headCount setTitle:[NSString stringWithFormat:@"%@条",model.commentsCount] forState:UIControlStateNormal];
    } else if (caseIndex == 1003) {
        _headImg.image = [UIImage imageNamed:@"Detail_infoIcon"];
        _headContent.text = @"自我介绍";
        _headCount.hidden = YES;
    } else {
        _headImg.image = [UIImage imageNamed:@"Detail_shouke_Icon"];
        _headContent.text = @"授课信息";
        _headCount.hidden = YES;
    }
    
    _commentTable.delegate = self;
    _commentTable.dataSource = self;
    _commentTable.tableFooterView = [[UIView alloc] init];
    [_commentTable reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_caseIndex == 1001) {
        return 1;
    } else  if (_caseIndex == 1003) {
        if (section == 0) {
            return 1;
        } else if (section == 1) {
            return _model.successfulCase.caseInfos.count;
        } else if (section == 2) {
            return _model.educationExperiences.experienceInfos.count;
        } else {
            
            return 1;
        }
        
    } else {
        return 1;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    if (_caseIndex == 1001) {
        return 1;
    } else if (_caseIndex == 1003) {
        return 4;
    } else {
        
        if (_model.grades.count == 0 && _model.region.count == 0) {
            return 0;
        } else if (_model.grades.count != 0 && _model.region.count == 0) {
        
            return 1;
        } else if (_model.grades.count == 0 && _model.region.count != 0) {
        
            return 1;
        }
        
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_caseIndex == 1001) {
        return [LZDetailCellManager tableView:tableView heightForRowAtIndexPath:indexPath CellCaseIndex:1002 detailModel:_model];
    } else if (_caseIndex == 1003){
        if (indexPath.section == 0) {
            return [LZDetailCellManager tableView:tableView heightForRowAtIndexPath:indexPath CellCaseIndex:1004 detailModel:_model];
        } else if (indexPath.section == 1) {
            return [LZDetailCellManager tableView:tableView heightForRowAtIndexPath:indexPath CellCaseIndex:1005 detailModel:_model];
        } else if (indexPath.section == 2) {
            return [LZDetailCellManager tableView:tableView heightForRowAtIndexPath:indexPath CellCaseIndex:1006 detailModel:_model];
        } else {
            return [LZDetailCellManager tableView:tableView heightForRowAtIndexPath:indexPath CellCaseIndex:1007 detailModel:_model];
        }
        
    } else {
        return [LZDetailCellManager tableView:tableView heightForRowAtIndexPath:indexPath CellCaseIndex:1009 detailModel:_model];
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_caseIndex == 1001) {
        return [LZDetailCellManager tableView:tableView cellForRowAtIndexPath:indexPath CellCaseIndex:1002 detailModel:_model];
    } else if (_caseIndex == 1003) {
        if (indexPath.section == 0) {
            return [LZDetailCellManager tableView:tableView cellForRowAtIndexPath:indexPath CellCaseIndex:1004 detailModel:_model];
        } else if (indexPath.section == 1) {
            return [LZDetailCellManager tableView:tableView cellForRowAtIndexPath:indexPath CellCaseIndex:1005 detailModel:_model];
        } else if (indexPath.section == 2) {
            return [LZDetailCellManager tableView:tableView cellForRowAtIndexPath:indexPath CellCaseIndex:1006 detailModel:_model];
        } else {
            return [LZDetailCellManager tableView:tableView cellForRowAtIndexPath:indexPath CellCaseIndex:1007 detailModel:_model];
        }
        
    } else {
        return [LZDetailCellManager tableView:tableView cellForRowAtIndexPath:indexPath CellCaseIndex:1009 detailModel:_model];
    }

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (_caseIndex == 1001) {
        return [LZDetailCellManager tableView:tableView viewForHeaderInSection:section detailModel:_model];
    } else if (_caseIndex == 1003) {
        
        if (section == 0) {
            
            LZDetaiCellHeadView *view = [[LZDetaiCellHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 20)contentText:@"教学特点" countText:@""];
            view.frame = CGRectMake(0, 0, kScreen_Width, 20);
            view.contentLabel.text = @"教学特点";
            view.countLabel.hidden = YES;
            return view;
        } else if (section == 1) {
            if (_model.successfulCase.caseInfos.count == 0) {
                return nil;
            } else {
                LZDetaiCellHeadView *view = [[LZDetaiCellHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 20)contentText:@"教学特点" countText:@""];
                view.frame = CGRectMake(0, 0, kScreen_Width, 20);
                view.contentLabel.text = @"成功案例";
                view.countLabel.hidden = YES;
                return view;
            
            }
            
            

        } else if (section == 2) {
            if (_model.educationExperiences.experienceInfos.count == 0) {
                return nil;
            } else {
                LZDetaiCellHeadView *view = [[LZDetaiCellHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 20)contentText:@"教育经历" countText:@""];
                view.frame = CGRectMake(0, 0, kScreen_Width, 20);
                view.contentLabel.text = @"教育经历";
                view.countLabel.hidden = YES;
                
                return view;
            }
        } else {
            LZDetaiCellHeadView *view = [[LZDetaiCellHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 20)contentText:@"毕业学校" countText:@""];
            view.frame = CGRectMake(0, 0, kScreen_Width, 20);
            view.contentLabel.text = @"毕业学校";
            view.countLabel.hidden = YES;
            
            return view;
        }
    } else {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (_caseIndex == 1001) {
        return [LZDetailCellManager tableView:tableView heightForHeaderInSection:section detailModel:_model];
    } else if (_caseIndex == 1003) {
        
        if (section == 0) {
            return 20;
        } else if (section == 1) {
            if (_model.successfulCase.caseInfos.count == 0) {
                return 0;
            } else {
                return 20;
            }
        } else if (section == 2) {
            if (_model.educationExperiences.experienceInfos.count == 0) {
                return 0;
            } else {
                return 20;
            }
        } else {
            return 20;
        }

    } else {
        return 0;
    }
    
}

- (IBAction)counBtn:(UIButton *)sender {
    if (self.filterResultBlock) {
        self.filterResultBlock();
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
