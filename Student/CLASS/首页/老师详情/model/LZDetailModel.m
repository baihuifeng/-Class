//
//  LZDetailModel.m
//  Student
//
//  Created by 葬花桥 on 2017/3/24.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZDetailModel.h"

@implementation LZDetailModel
+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"commentTags":@"CommentTagsModel",@"grades":@"GradesModel",@"skills":@"GradesModel"};
}



@end

@implementation ComeWithGoModel



@end

@implementation GradesModel



@end
@implementation LastCommentsModel


@end
@implementation SuccessfulCaseModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"caseInfos":@"ContentModel"};
}




@end
@implementation ContentModel


@end
@implementation EducationExperiencesModel
+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"experienceInfos":@"ContentModel"};
}

@end

@implementation CommentTagsModel



@end

@implementation PriceModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"mode":@"ComeWithGoModel"};
}



@end


