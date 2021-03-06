//
//  NSString+Check.m
//  JunlongcaiNews
//
//  Created by sixiaodong on 14-2-28.
//  Copyright (c) 2014年 qiyun. All rights reserved.
//

#import "NSString+Check.h"

@implementation NSString (Check)
+ (BOOL) validateUserName:(NSString *)name
{
    //[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}
    NSString *userName = @"[_a-zA-Z0-9]{4,20}";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userName];
    BOOL b = [userNamePredicate evaluateWithObject:name];
    return b;
}
+ (BOOL) validatePassWord:(NSString *)pw
{
    NSString *password = @"[_A-Za-z0-9]{6,20}";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",password];
   BOOL B =[passWordPredicate evaluateWithObject:pw];
    return B;
}
+ (BOOL) isNumber:(NSString *)num
{
    NSString *password = @"^[0-9]+(.[0-9]{1,3})?$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",password];
    BOOL B =[passWordPredicate evaluateWithObject:num];
    return B;
}
//身份证
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
+ (BOOL) validateCutomerName:(NSString *)name length:(NSUInteger)length{
    if (name.length == 0) {
        return NO;
    }
    NSString * regexString = [NSString stringWithFormat:@"^[%@]{0,%lu}$",@"[A-Za-z0-9\u4e00-\u9fa5]", length];
//    NSString * regexString = [NSString stringWithFormat:@"^[%@]{0,%lu}$",@"[\u4e00-\u9fa5]", length];
//    NSString * regexString = [NSString stringWithFormat:@"^[%@]{0,%lu}$",@"[A-Za-z]", length];
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexString];
    BOOL b = [userNamePredicate evaluateWithObject:name];
    return b;

}

+ (BOOL)validateFigure:(NSString *)string length:(NSUInteger)length{
    if (string.length == 0) {
        return NO;
    }
    NSString * regexString = [NSString stringWithFormat:@"^[%@]{0,%lu}$",@"[0-9]", length];
    //    NSString * regexString = [NSString stringWithFormat:@"^[%@]{0,%lu}$",@"[\u4e00-\u9fa5]", length];
    //    NSString * regexString = [NSString stringWithFormat:@"^[%@]{0,%lu}$",@"[A-Za-z]", length];
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexString];
    BOOL b = [userNamePredicate evaluateWithObject:string];
    return b;
   
}

+ (BOOL)validateEnglish:(NSString *)string length:(NSUInteger)length {
    if (string.length == 0) {
        return NO;
    }
    NSString * regexString = [NSString stringWithFormat:@"^[%@]{0,%lu}$",@"[A-Za-z]", length];
    //    NSString * regexString = [NSString stringWithFormat:@"^[%@]{0,%lu}$",@"[\u4e00-\u9fa5]", length];
    //    NSString * regexString = [NSString stringWithFormat:@"^[%@]{0,%lu}$",@"[A-Za-z]", length];
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexString];
    BOOL b = [userNamePredicate evaluateWithObject:string];
    return b;
}

+ (BOOL)validateEnglishWithFigure:(NSString *)string length:(NSUInteger)length {
    if (string.length == 0) {
        return NO;
    }
    NSString * regexString = [NSString stringWithFormat:@"^[%@]{0,%lu}$",@"[A-Za-z0-9]", length];
    //    NSString * regexString = [NSString stringWithFormat:@"^[%@]{0,%lu}$",@"[\u4e00-\u9fa5]", length];
    //    NSString * regexString = [NSString stringWithFormat:@"^[%@]{0,%lu}$",@"[A-Za-z]", length];
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexString];
    BOOL b = [userNamePredicate evaluateWithObject:string];
    return b;
}


+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
@end
