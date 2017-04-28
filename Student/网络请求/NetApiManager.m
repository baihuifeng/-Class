//
//  NetApiManager.m
//  CeShiTest
//
//  Created by 葬花桥 on 2017/3/9.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#import "NetApiManager.h"
#import "RealReachability.h"

#import "NSDictionary+NullReplacement.h"


static NetApiManager *netApiManager;

@implementation NetApiManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netApiManager = [[NetApiManager alloc]init];
        netApiManager.serviceType = SERVICE_TYPE;
        [RealReachability sharedInstance].hostForPing = @"m.jyall.com";
        [GLobalRealReachability startNotifier];
        
    });
    return netApiManager;
}
+(NSString *)get_BASEURL{
    NSInteger type = [NetApiManager sharedInstance].serviceType;
    if (type == 1) {
        return DEV_BASEURL;
    }else if (type == 2) {
        return TEST_BASEURL;
    }else if (type == 3) {
        return PRO_BASEURL;
    }
    return PRO_BASEURL;
    
}

/**
 *  处理接口返回字段为 null 问题
 *  @return 用“”替换“null”后的数据结果
 */
+ (id)replaceNullsWithBlanksWithResponseObject:(id)responseObject
{
    if ([responseObject isKindOfClass:[NSArray class]]) {
        responseObject = [responseObject arrayByReplacingNullsWithBlanks];
    }
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        responseObject = [responseObject dictionaryByReplacingNullsWithBlanks];
    }
    return responseObject;
}
+ (void)getFromURL:(NSString *)URLString
            params:(NSDictionary *)params
          finished:(NetApiCallBack)finished
{
    
    AFHTTPSessionManager *manager = [NetApiManager sharedInstance].manager;
    
    NSLog(@"---->%@",manager.requestSerializer.HTTPRequestHeaders);
    NSLog(@"---->%@",URLString);
    [manager GET:URLString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        responseObject = [self replaceNullsWithBlanksWithResponseObject:responseObject];
        NetResponse *apiObject = [[NetResponse alloc]initWithTask:task responseObject:responseObject error:nil];
        finished(apiObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NetResponse *apiObject = [[NetResponse alloc]initWithTask:task responseObject:nil error:error];
        [apiObject checkNotReachability];
        
        finished(apiObject);
        //tokenid失效返回code 然后弹出登录
    }];
}

+ (void)postToURL:(NSString *)URLString
       bodyParams:(id)bodyParams
         finished:(NetApiCallBack)finished
{
    
    NSLog(@"isReachable--->%ld",[RealReachability sharedInstance].currentReachabilityStatus);
    
    AFHTTPSessionManager *manager = [NetApiManager sharedInstance].manager;
    [manager POST:URLString parameters:bodyParams progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        responseObject = [self replaceNullsWithBlanksWithResponseObject:responseObject];
        
        NetResponse *apiObject = [[NetResponse alloc]initWithTask:task responseObject:responseObject error:nil];
        finished(apiObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NetResponse *apiObject = [[NetResponse alloc]initWithTask:task responseObject:nil error:error];
        
        [apiObject checkNotReachability];
        finished(apiObject);
        //tokenid失效返回code 然后弹出登录

    }];
}

+ (void)postToImgUrl:(NSString *)strUrl parme:(NSDictionary *)parme ImgArr:(NSArray *)imgArr finished:(NetApiCallBack)finished {
    AFHTTPSessionManager *manager = [NetApiManager sharedInstance].manager;
    
    [manager POST:strUrl parameters:parme constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (int i = 0; i<imgArr.count; i++) {
            
            UIImage *image = imgArr[i];
            NSData* imageData = UIImageJPEGRepresentation(image, 0.3);
            if (!imageData) {
                imageData = UIImagePNGRepresentation(image);
            }
            [formData appendPartWithFileData:imageData name:@"file" fileName:[NSString stringWithFormat:@"file%d",i] mimeType:@"image/jpeg"];
            
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        responseObject = [self replaceNullsWithBlanksWithResponseObject:responseObject];
        
        NetResponse *apiObject = [[NetResponse alloc]initWithTask:task responseObject:responseObject error:nil];
        finished(apiObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NetResponse *apiObject = [[NetResponse alloc]initWithTask:task responseObject:nil error:error];
        
        [apiObject checkNotReachability];
        finished(apiObject);
        
    }];
}


- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
        sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        sessionManager.responseSerializer = responseSerializer;
        [sessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        sessionManager.requestSerializer.timeoutInterval = 30.f;
        [sessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",@"text/html",@"text/json",@"text/plain",@"text/javascript",@"text/xml",@"image/*",@"application/x-www-form-urlencoded"]];
        sessionManager.operationQueue.maxConcurrentOperationCount = 3;
        /*
         NSURL * url = [NSURL URLWithString:@"https://www.google.com"];
         AFHTTPRequestOperationManager * requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
         dispatch_queue_t requestQueue = dispatch_create_serial_queue_for_name("kRequestCompletionQueue");
         requestOperationManager.completionQueue = requestQueue;
         
         AFSecurityPolicy * securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
         
         //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
         //如果是需要验证自建证书，需要设置为YES
         securityPolicy.allowInvalidCertificates = YES;
         
         //validatesDomainName 是否需要验证域名，默认为YES；
         //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
         //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
         //如置为NO，建议自己添加对应域名的校验逻辑。
         securityPolicy.validatesDomainName = YES;
         
         //validatesCertificateChain 是否验证整个证书链，默认为YES
         //设置为YES，会将服务器返回的Trust Object上的证书链与本地导入的证书进行对比，这就意味着，假如你的证书链是这样的：
         //GeoTrust Global CA
         //    Google Internet Authority G2
         //        *.google.com
         //那么，除了导入*.google.com之外，还需要导入证书链上所有的CA证书（GeoTrust Global CA, Google Internet Authority G2）；
         //如是自建证书的时候，可以设置为YES，增强安全性；假如是信任的CA所签发的证书，则建议关闭该验证，因为整个证书链一一比对是完全没有必要（请查看源代码）；
         securityPolicy.validatesCertificateChain = NO;
         
         requestOperationManager.securityPolicy = securityPolicy;*/
        /**********************************************/
        //        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
        //        securityPolicy.allowInvalidCertificates = NO;
        //
        //        securityPolicy.validatesDomainName = NO;
        //        sessionManager.securityPolicy = securityPolicy;
        //        sessionManager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        /**********************************************/
        _manager = sessionManager;
        
        
    }
    [NetApiManager setHttpCommonHeader:_manager];
    
    return _manager;
}
+ (void)setHttpCommonHeader:(AFHTTPSessionManager *)manager{
    //    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSString * loaction = @"0.000000";
    
    NSTimeInterval a=[[NSDate date] timeIntervalSince1970];
    NSString *timeSp = [NSString stringWithFormat:@"%.0f", a];
/*
    [manager.requestSerializer setValue:[UMSAgent getUMSUDID] forHTTPHeaderField:@"deviceid"];
    [manager.requestSerializer setValue:[GeneralTool deviceVersion] forHTTPHeaderField:@"devicebrand"];
    NSString *screenString = [NSString stringWithFormat:@"%.0fx%.0f",[UIScreen mainScreen].bounds.size.width * [UIScreen mainScreen].scale,[UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].scale];
    [manager.requestSerializer setValue:screenString forHTTPHeaderField:@"deviceresolution"];
    NSString *systemString = [NSString stringWithFormat:@"iOS %@",[UIDevice currentDevice].systemVersion];
    [manager.requestSerializer setValue:timeSp forHTTPHeaderField:@"timestamp"];
    [manager.requestSerializer setValue:systemString forHTTPHeaderField:@"systembrand"];
    [manager.requestSerializer setValue:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] forHTTPHeaderField:@"version"];
    [manager.requestSerializer setValue:HomeHealthAPPKEY forHTTPHeaderField:@"APPkey"];
    
    
    NSMutableString *mString = [[NSMutableString alloc] init];
    [mString appendString:[NSString stringWithFormat:@"APPkey=%@",HomeHealthAPPKEY]];
    
    [mStr￼ing appendFormat:@"&cityId=%@",[HHCommonManager sharedHHCommonManager].cityId];
    [mString appendString:[NSString stringWithFormat:@"&devicebrand=%@",[GeneralTool deviceVersion]]];
    if ([UMSAgent getUMSUDID]) {
        [mString appendString:[NSString stringWithFormat:@"&deviceid=%@",[UMSAgent getUMSUDID]]];
    }
    [mString appendString:[NSString stringWithFormat:@"&deviceresolution=%@",screenString]];
    [mString appendFormat:@"&lat=%@",loaction];
    [mString appendFormat:@"&lon=%@",loaction];
    [mString appendString:[NSString stringWithFormat:@"&systembrand=%@",systemString]];
    [mString appendString:[NSString stringWithFormat:@"&timestamp=%@",timeSp]];
    [mString appendString:[NSString stringWithFormat:@"&version=%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]]];
    [mString appendString:@"&key=CE103EF654AF24D55D286D574C234749"];
    
    NSString *md5String = [mString md5Encrypt];
        NSLog(@"id---->%@",[UMSAgent getUMSUDID]);
    
    [manager.requestSerializer setValue:md5String forHTTPHeaderField:@"sign"];
    
    [manager.requestSerializer setValue:[HHCommonManager sharedHHCommonManager].cityId forHTTPHeaderField:@"cityId"];
    [manager.requestSerializer setValue:loaction forHTTPHeaderField:@"lat"];
    [manager.requestSerializer setValue:loaction forHTTPHeaderField:@"lon"];
 
    if ([HHCommonManager sharedHHCommonManager].tokenId.length > 0) {
        [manager.requestSerializer setValue:[HHCommonManager sharedHHCommonManager].tokenId forHTTPHeaderField:@"tokenid"];
    }
  */
    
}



@end

@implementation NetResponse

- (instancetype)initWithTask:(NSURLSessionDataTask *)task responseObject :(id)responseObject error :(NSError *) error{
    self = [super init];
    NSLog(@"%@",responseObject);
    if (self = [super init]) {
        self.url = task.originalRequest.URL.absoluteString;
        self.httpCode = [[responseObject objectForKey:@"status"] integerValue];
        self.responseObject = responseObject;
        _task = task;
        if (self.httpCode == 0) {
            self.isSuccess = YES;
        }else{
            self.isSuccess = NO;
            if (responseObject!= nil) {
                self.errorMessage = responseObject[@"msg"];
            } else {
                int code;
                
                self.errorMessage = [self getErrorMessage:error code:&code];
                self.code = code;
                self.error = error;

            }

        }
    }
    return self;
}

-(NSString *)getErrorMessage:(NSError *)error code:(int *)code
{
    NSString *errorMessage = nil;
    for (id data in error.userInfo.allValues) {
        if ([data isKindOfClass:[NSData class]]) {
                        NSString * totalString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            errorMessage = dic[@"msg"];
            *code = [dic[@"status"] intValue];
        }
        if ([data isKindOfClass:[NSError class]]) {
            errorMessage = [self getErrorMessage:data code:code];
        }
    }
    if (errorMessage == nil || [errorMessage isKindOfClass:[NSNull class]]) {
        return @"请求失败";
    }
    return errorMessage;
}

-(NetResponse *)checkNotReachability{
    if (self.httpCode == 500 ||self.httpCode == 400) {
        return self;
    }
//    NSInteger status = [RealReachability sharedInstance].currentReachabilityStatus;
//    if (status == RealStatusNotReachable) {
//        self.isSuccess = NO;
//        self.httpCode = KNoNetWorkCode;
//        self.code = KNoNetWorkCode;
//        self.errorMessage = @"网络连接失败";
//    }
    return self;
}


@end
