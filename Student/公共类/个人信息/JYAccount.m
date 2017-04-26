//
//  JYAccount.m
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 16/3/21.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//


/*
 @property (nonatomic,copy) NSString *id;
 @property (nonatomic,copy) NSString *name;
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
 */

#import "JYAccount.h"

@implementation JYAccount




- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.nickName = [decoder decodeObjectForKey:@"nickName"];
        self.sex = [decoder decodeObjectForKey:@"sex"];
        self.age = [decoder decodeObjectForKey:@"age"];
        self.cellPhone = [decoder decodeObjectForKey:@"cellPhone"];
        self.gradeName = [decoder decodeObjectForKey:@"gradeName"];
        self.expectSkills = [decoder decodeObjectForKey:@"expectSkills"];
        self.balance = [decoder decodeObjectForKey:@"balance"];
        self.depositPrice = [decoder decodeObjectForKey:@"depositPrice"];
        self.withdrawPrice = [decoder decodeObjectForKey:@"withdrawPrice"];
        self.rewardPrice = [decoder decodeObjectForKey:@"rewardPrice"];
        self.completion = [decoder decodeObjectForKey:@"completion"];
        self.regionName = [decoder decodeObjectForKey:@"regionName"];
        self.address = [decoder decodeObjectForKey:@"address"];
        self.headImgUrl = [decoder decodeObjectForKey:@"headImgUrl"];
        self.imName = [decoder decodeObjectForKey:@"imName"];
        self.imPsw = [decoder decodeObjectForKey:@"imPsw"];//
        
        
        self.password = [decoder decodeObjectForKey:@"password"];
        self.regionCode = [decoder decodeObjectForKey:@"regionCode"];
        self.gradeId = [decoder decodeObjectForKey:@"gradeId"];
        self.deviceId = [decoder decodeObjectForKey:@"deviceId"];
        self.userId = [decoder decodeObjectForKey:@"userId"];
        self.gps = [decoder decodeObjectForKey:@"gps"];
        self.verifyCode = [decoder decodeObjectForKey:@"verifyCode"];

    }
    return self;
}

/**
 *  将对象写入文件的时候调用
 *  在这个方法中写清除：要存储哪些对象的哪些属性，以及怎样存储属性
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.nickName forKey:@"nickName"];
    [encoder encodeObject:self.sex forKey:@"sex"];
    [encoder encodeObject:self.cellPhone forKey:@"cellPhone"];
    [encoder encodeObject:self.gradeName forKey:@"gradeName"];
    [encoder encodeObject:self.expectSkills forKey:@"expectSkills"];
    [encoder encodeObject:self.balance forKey:@"balance"];
    [encoder encodeObject:self.depositPrice forKey:@"depositPrice"];
    
    [encoder encodeObject:self.withdrawPrice forKey:@"withdrawPrice"];
    [encoder encodeObject:self.rewardPrice forKey:@"rewardPrice"];
    [encoder encodeObject:self.completion forKey:@"completion"];
    [encoder encodeObject:self.regionName forKey:@"regionName"];
    [encoder encodeObject:self.address forKey:@"address"];
    [encoder encodeObject:self.headImgUrl forKey:@"headImgUrl"];
    [encoder encodeObject:self.imName forKey:@"imName"];
    [encoder encodeObject:self.imPsw forKey:@"imPsw"];

    [encoder encodeObject:self.password forKey:@"password"];
    [encoder encodeObject:self.regionCode forKey:@"regionCode"];
    [encoder encodeObject:self.gradeId forKey:@"gradeId"];
    [encoder encodeObject:self.deviceId forKey:@"deviceId"];
    [encoder encodeObject:self.userId forKey:@"userId"];
    [encoder encodeObject:self.gps forKey:@"gps"];
    [encoder encodeObject:self.verifyCode forKey:@"verifyCode"];
}

@end


