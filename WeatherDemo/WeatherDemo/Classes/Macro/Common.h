//
//  Common.h
//  dc
//
//  Created by ZC on 15/11/6.
//  Copyright © 2015年 IOCDOC. All rights reserved.
//

#ifndef Common_h
#define Common_h

#pragma mark - 👉🏻Device
#define kDeviceSystemVersion [[UIDevice currentDevice].systemVersion doubleValue]

#pragma mark - 👉🏻Size
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kTinyButtonWidth 40
#define kTinyButtonHeight 20
#define kShortButtonWidth kScreenWidth/3
#define kShortButtonHeight kScreenWidth/10
#define kMiddleButtonWidth kScreenWidth*3/5
#define kMiddleButtonHeight kScreenWidth/10
#define kLongTextFieldWidth kScreenWidth*2/3
#define kLongTextFieldHeight kScreenWidth/10
#define Kwidth self.view.frame.size.width
#define Kheight self.view.frame.size.height

#pragma mark - 👉🏻Color
#define kThemeColorLightBlue [UIColor colorWithRed:49.0/255 green:225.0/255 blue:190.0/255 alpha:1]
#define kThemeColorDarkBlue [UIColor colorWithRed:57.0/255 green:201.0/255 blue:236.0/255 alpha:1]
#define kThemeColorLightBlueWithAlpha0_5 [UIColor colorWithRed:49.0/255 green:225.0/255 blue:190.0/255 alpha:0.5]
#define kThemeColorDarkBlueWithAlpha0_5 [UIColor colorWithRed:57.0/255 green:201.0/255 blue:236.0/255 alpha:0.5]
#define kLightGray [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1]
#define kGrayWhiteColor [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1]

#undef	RGB
#define RGB(R,G,B)		[UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]

#undef	RGBA
#define RGBA(R,G,B,A)	[UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

#undef	HEX_RGB
#define HEX_RGB(V)		[UIColor colorForHex:V]

#undef	HEX_RGBA
#define HEX_RGBA(V, A)	[UIColor colorForHex:V alpha:A]

#define UIFont(x) [UIFont systemFontOfSize:x]

#pragma mark - 👉🏻Notification
#define kAreaSelectedNotification @"AreaSelectedNotification"
#define KHospitalSelectedNotification @"HospitalSelectedNotification"
#define kAreaCollectedNotification @"kAreaCollectedNotification"
#define kReloadSearchResultTableViewData @"kReloadSearchResultTableViewData"
#define kAddDoctorToFamiliarList @"addDoctorToFamiliarList"

#pragma mark - 👉🏻AppDelegate
#define KAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

// 控件圆角
#define viewCornerRadius 5

//定义weak，用于block
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#pragma mark - 👉🏻URL
#define server_base_image_url @"http://iocdocheadimg.oss-cn-beijing.aliyuncs.com/"
#define DCAppStoreUrl @"http://itunes.apple.com/cn/lookup?id=1064025496"
#define NewestVersionAppStoreUrl @"itms-apps:"

#pragma mark - 👉🏻Server

#define server_base_url     @"http://app.iocdoc.com:8080/aidaoke/servlet"

#ifdef DEBUG
#define server_dataload_url @"http://10.0.0.14:8080/aidaoke/servlet/ACSClientHttp"
#else
#define server_dataload_url @"https://app.iocdoc.com/aidaoke/servlet/ACSClientHttp"
#endif

//#define server_dataload_url @"http://10.0.0.7:8080/aidaoke/servlet/ACSClientHttp"

#ifdef DEBUG
#define doctorInfoUrl @"http://10.0.0.15:8080/aidaoke/servlet/ACSClientHttp?beanName=aidaokedoctorhttpservice&usercheck=&orderdc=M0000000000256&page=1&imei=0000000&request_code=1&appcode=AIDAOKE&devicetype=html&devicetoken=112121222&parentcode=&type=1&methodName=searchDoctorList&version=v1.0&pagesize=500"
#else
#define doctorInfoUrl @"http://app.iocdoc.com:8080/aidaoke/servlet/ACSClientHttp?beanName=aidaokedoctorhttpservice&usercheck=&orderdc=M0000000000256&page=1&imei=0000000&request_code=1&appcode=AIDAOKE&devicetype=html&devicetoken=112121222&parentcode=&type=1&methodName=searchDoctorList&version=v1.0&pagesize=500"
#endif

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define ICASuccess NSLog(@"成功：%@",response)
#define ICAFailure NSLog(@"失败：%@",response)

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height


#endif /* Common_h */
