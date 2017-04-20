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

//#define LZImgUrl [NSString stringWithFormat:@"%@upload/",ManagerUrl]


#pragma -mark “首页”
#define LZHomeUrl [NSString stringWithFormat:@"%@Students/getInitData?",ManagerUrl]

#pragma -mark “详情页面”

#define LZDedailUrl [NSString stringWithFormat:@"%@Students/getProviderInfo?",ManagerUrl]

#define LZTeacherList [NSString stringWithFormat:@"%@Students/getInfoList?",ManagerUrl]

#define LZOrderList [NSString stringWithFormat:@"%@Students/getSubjectInfo?",ManagerUrl]




#endif /* LZRequestUrlManager_h */
