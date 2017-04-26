//
//  LZChooseExpectSkillCell.h
//  Student
//
//  Created by 白慧峰 on 2017/4/25.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZChooseExpectSkillCell;

@protocol ChooseSubjectDelegate <NSObject>

- (void)chooseSubjectDelegate:(LZChooseExpectSkillCell *)cell;

@end


@interface LZChooseExpectSkillCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleContent;
@property (weak, nonatomic) IBOutlet UIButton *chooseSender;

@property (assign,nonatomic) NSIndexPath *indexPath;

@property (weak,nonatomic) id <ChooseSubjectDelegate>delegate;


@end
