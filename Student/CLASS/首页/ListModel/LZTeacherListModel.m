//
//  LZTeacherListModel.m
//  Student
//
//  Created by bai on 2017/3/27.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "LZTeacherListModel.h"

@implementation LZTeacherListModel
+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"data":@"ListModel"};
}

@end

@implementation ListModel


@end


@implementation LZHomeModel
+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"dynamicBanner":@"DynamicinfosModel",@"skills":@"SkillsModel",@"recommendTeachers":@"ListModel",@"dynamicOperative":@"DynamicinfosModel"};
}

@end

@implementation DynamicinfosModel


@end

@implementation SkillsModel



@end
