//
//  LZTeacherListModel.h
//  Student
//
//  Created by bai on 2017/3/27.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TagsInfoModel : NSObject
@property (nonatomic,copy) NSString *id;
@property (nonatomic,copy) NSString *name;
@end

@interface ListModel : NSObject

@property (nonatomic,copy) NSString *userID;
@property (nonatomic,copy) NSString *imgUrl;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,strong) NSArray *tagsInfo;
@property (nonatomic,copy) NSString *isExclusive;
@property (nonatomic,copy) NSString *satisfaction;
@property (nonatomic,strong) NSArray *certificationTags;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *distance;
@property (nonatomic,copy) NSString *sex;
@property (nonatomic,strong) NSArray *features;
@end

@interface LZTeacherListModel : NSObject


@property (nonatomic,strong) NSArray *data;
@end



@interface LZHomeModel : NSObject

@property (nonatomic,strong) NSArray *dynamicBanner;
@property (nonatomic,strong) NSArray *dynamicOperative;
@property (nonatomic,strong) NSArray *skills;
@property (nonatomic,strong) NSArray *dynamicNews;
@property (nonatomic,strong) NSArray *recommendTeachers;
@end

@interface DynamicinfosModel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *describe;
@property (nonatomic,copy) NSString *actionType;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *imgUrl;
@property (nonatomic,copy) NSString *jumpData;
@end

@interface SkillsModel : NSObject
@property (nonatomic,copy) NSString *id;
@property (nonatomic,copy) NSString *tagTitle;
@property (nonatomic,copy) NSString *tagImgUrl;
@end

