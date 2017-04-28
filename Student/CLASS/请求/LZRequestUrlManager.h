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

#define LZMiYaoSalt @"lzjy_login_app_slat"

//#define LZImgUrl [NSString stringWithFormat:@"%@upload/",ManagerUrl]

#pragma -mark "上传图片"
#define LZUpLoadImg [NSString stringWithFormat:@"%@Common/upload",ManagerUrl]


#pragma -mark “首页”
#define LZHomeUrl [NSString stringWithFormat:@"%@Students/getInitData?",ManagerUrl]
#pragma -mark "科目"
#define LZGetSubject [NSString stringWithFormat:@"%@Students/getTypeTags?",ManagerUrl]


#pragma -mark “详情页面”

#define LZDedailUrl [NSString stringWithFormat:@"%@Students/getProviderInfo?",ManagerUrl]

#define LZTeacherList [NSString stringWithFormat:@"%@Students/getInfoList?",ManagerUrl]

#define LZOrderList [NSString stringWithFormat:@"%@Students/getSubjectInfo?",ManagerUrl]

#pragma -mark "收藏"
#define LZCollection [NSString stringWithFormat:@"%@Common/collection?",ManagerUrl]


#pragma -mark "个人信息/编辑"
#define LZInfoUrl [NSString stringWithFormat:@"%@Students/getUserInfo?",ManagerUrl]
#define LZEditInfoUrl [NSString stringWithFormat:@"%@Students/modifyUserInfo",ManagerUrl]



#pragma -mark "年级信息/区域"
#define LZGradeInfo [NSString stringWithFormat:@"%@Students/getGradeInfo?",ManagerUrl]
#define LZRegion [NSString stringWithFormat:@"%@Common/getRegion?",ManagerUrl]


#pragma -mark "建议"
#define LZJianYi [NSString stringWithFormat:@"%@Common/complaint",ManagerUrl]

#pragma -mark “注册”
#define LZZhuCe [NSString stringWithFormat:@"%@User/register",ManagerUrl]

#pragma -mark "登录"
#define LZLogin [NSString stringWithFormat:@"%@User/login?",ManagerUrl]




#endif /* LZRequestUrlManager_h */
