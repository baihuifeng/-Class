//
//  JYAccount.h
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 16/3/21.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//
/*
 {
 "id": 1,
 "name": "佟旭阳1",
 "sex": "男",
 "age": 15,
 "cellPhone": "18500407013",
 "gradeName": "四年级",
 "expectSkills": [
 {
 "id": "2",
 "name": "数学"
 },
 {
 "id": "3",
 "name": "英语"
 }
 ],
 "balance": "500.00",
 "depositPrice": "0.00",
 "withdrawPrice": 0,
 "rewardPrice": 0,
 "completion": 50,
 "regionName": "新市区",
 "address": "竞秀区天威西路3223",
 "headImgUrl": "upload/image/7b593b48e9e815272f45dcc3777d6a48.png",
 "imName": "18500407013_1",
 "imPsw": "621c30bbbb4dc9778a23e33e12259bf9"
 }
 */
#import <Foundation/Foundation.h>
#import "LZTeacherListModel.h"

@interface JYAccount : NSObject

@property (nonatomic,copy) NSString *nickName;
@property (nonatomic,copy) NSString *sex;
@property (nonatomic,copy) NSString *age;
@property (nonatomic,copy) NSString *cellPhone;
@property (nonatomic,copy) NSString *gradeName;
@property (nonatomic,strong) NSArray  *expectSkills;
@property (nonatomic,copy) NSString *balance;
@property (nonatomic,copy) NSString *depositPrice;
@property (nonatomic,copy) NSString *withdrawPrice;
@property (nonatomic,copy) NSString *rewardPrice;
@property (nonatomic,copy) NSString *completion;
@property (nonatomic,copy) NSString *regionName;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *headImgUrl;
@property (nonatomic,copy) NSString *imName;
@property (nonatomic,copy) NSString *imPsw;

@property (nonatomic,copy) NSString *password;
@property (nonatomic,copy) NSString *regionCode;
@property (nonatomic,copy) NSString *gradeId;

@property (nonatomic,copy) NSString *deviceId;

@property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *gps;
@property (nonatomic,copy) NSString *verifyCode;

@end
