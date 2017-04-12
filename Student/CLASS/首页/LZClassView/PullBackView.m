//
//  PullBackView.m
//  HomeHealth
//
//  Created by 葬花桥 on 2016/12/29.
//  Copyright © 2016年 ChiJian. All rights reserved.
//

#import "PullBackView.h"

@implementation PullBackView


- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
     
        self.backgroundColor = [UIColor colorWithWhite:0.6 alpha:0.6];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissView)]];
    }
    
    return self;

}


- (void)showView:(UIView *)view itmesCount:(int)count {
    
    if (_tableView == nil) {
        [UIView animateWithDuration:1 animations:^{
            _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 0)style:UITableViewStylePlain];
            _tableView.delegate = self;
            _tableView.dataSource = self;
            [self addSubview:_tableView];
        }];
        _rowArr = [[NSMutableArray alloc] init];
        for (int i = 0; i<count; i++) {
            [_rowArr addObject:@0];
        }
        _notesArr = [[NSMutableArray alloc] init];
    }
    

}

- (void)reloadDate:(int)index dateArr:(NSArray *)dateArr {
    
    
    if (_tableView.frame.size.height != kScreen_Height-200) {
        [UIView animateWithDuration:0.5 animations:^{
            CGRect rect = self.frame;
            
            rect.size.height = kScreen_Height;
            
            self.frame = rect;
            CGRect tabRect = _tableView.frame;
            tabRect.size.height = kScreen_Height-200;
            _tableView.frame = tabRect;
        }];

    }
    
    _index = index;
    _dataArr = dateArr;
    
    for (int i= 0; i <dateArr.count; i++) {
        for (int i = 0; i <[dateArr[_index] count]; i++) {
            [_notesArr addObject:dateArr[_index][0]];
        }
        
    }
    
    [_tableView reloadData];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_dataArr[_index] count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"qqq";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    PullModel *model = _dataArr[_index][indexPath.row];
    if (indexPath.row == [_rowArr[_index] integerValue]) {
        cell.textLabel.textColor = [UIColor redColor];
    } else {
        cell.textLabel.textColor = [UIColor blackColor];
    }
    cell.textLabel.text = model.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [_rowArr replaceObjectAtIndex:_index withObject:@((int)indexPath.row)];

    [_notesArr replaceObjectAtIndex:_index withObject:_dataArr[_index][indexPath.row]];
    
    if (self.filterResultBlock) {
        self.filterResultBlock(_notesArr,_index);
    }

    [self dismissView];
}

- (void)dismissView
{
    self.superview.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = self.frame;
        
        rect.size.height = 0;
        
        self.frame = rect;
        CGRect tabRect = _tableView.frame;
        tabRect.size.height = 0;
        _tableView.frame = tabRect;
    }];

}


@end
