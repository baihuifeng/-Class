//
//  LZDetailModel.h
//  Student
//
//  Created by 葬花桥 on 2017/3/24.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LastCommentsModel : NSObject
@property (nonatomic,copy) NSString *customImgUrl;
@property (nonatomic,copy) NSString *customNickName;
@property (nonatomic,copy) NSString *customGrade;
@property (nonatomic,copy) NSString *commentsTime;
@property (nonatomic,copy) NSString *learnTime;
@property (nonatomic,copy) NSString *comment;
@property (nonatomic,copy) NSString *feedback;
@end
@interface SuccessfulCaseModel : NSObject
@property (nonatomic,copy) NSString *caseCount;
@property (nonatomic,strong) NSArray *caseInfos;
@end

@interface ContentModel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *timeTitle;
@end

@interface EducationExperiencesModel : NSObject
@property (nonatomic,copy) NSString *experienceCount;
@property (nonatomic,strong) NSArray *experienceInfos;
@end

@interface CommentTagsModel : NSObject

@property (nonatomic,copy) NSString *supportCount;
@property (nonatomic,copy) NSString *tagName;
@property (nonatomic,copy) NSString *tagID;
@end

@interface LZDetailModel : NSObject

@property (nonatomic,copy) NSString *isCollection;
@property (nonatomic,copy) NSString *imgUrl;
@property (nonatomic,copy) NSString *nickName;
@property (nonatomic,copy) NSString *priceDescribe;
@property (nonatomic,copy) NSString *teachingTime;
@property (nonatomic,copy) NSString *studensCount;
@property (nonatomic,copy) NSString *teachingAge;
@property (nonatomic,copy) NSString *satisfaction;
@property (nonatomic,strong) NSArray *certificationTags;
@property (nonatomic,strong) NSArray *commentTags;
@property (nonatomic,copy) NSString *commentsCount;
@property (nonatomic,strong) LastCommentsModel *lastComments;

@property (nonatomic,copy) NSString *characteristics;
@property (nonatomic,strong) SuccessfulCaseModel *successfulCase;
@property (nonatomic,strong) EducationExperiencesModel *educationExperiences;
@property (nonatomic,copy) NSString *college;
@property (nonatomic,strong) NSArray *grades;
@property (nonatomic,strong) NSArray *region;

@property (nonatomic,strong) NSArray *price;


@end

@interface PriceModel : NSObject

@property (nonatomic,copy) NSString *gradeId;
@property (nonatomic,copy) NSString *gradeName;
@property (nonatomic,copy) NSString *skillId;
@property (nonatomic,copy) NSString *skillName;
@property (nonatomic,copy) NSString *visit;
@property (nonatomic,copy) NSString *come;

@end
