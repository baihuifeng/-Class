//
//  LZTeacherListModel.h
//  Student
//
//  Created by bai on 2017/3/27.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject

@property (nonatomic,copy) NSString *userID;
@property (nonatomic,copy) NSString *imgUrl;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,strong) NSArray *tagsInfo;
@property (nonatomic,copy) NSString *isExclusive;
@property (nonatomic,copy) NSString *satisfaction;
@property (nonatomic,strong) NSArray *certificationTags;
@end

@interface LZTeacherListModel : NSObject


@property (nonatomic,strong) NSArray *data;
@end
