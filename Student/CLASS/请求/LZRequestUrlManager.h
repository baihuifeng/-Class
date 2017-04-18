//
//  LZRequestUrlManager.h
//  Student
//
//  Created by 白慧峰 on 2017/4/17.
//  Copyright © 2017年 葬花桥. All rights reserved.
//

#ifndef LZRequestUrlManager_h
#define LZRequestUrlManager_h

#define ManagerUrl  NetApiManager.get_BASEURL

#define LZImgUrl [NSString stringWithFormat:@"%@upload/",ManagerUrl]


#pragma -mark “首页”
#define LZHomeUrl [NSString stringWithFormat:@"%@Api/getInitData?",ManagerUrl]

#pragma -mark “详情页面”

#define LZDedailUrl [NSString stringWithFormat:@"%@Api/getProviderInfo?userId=",ManagerUrl]




#endif /* LZRequestUrlManager_h */
