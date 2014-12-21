//
//  GlobalConfig.h
//  Forum
//
//  Created by Lei Zhu on 12-8-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "AppDelegate.h"

#ifndef GLOBAL_CONFIG
#define GLOBAL_CONFIG

//#import "JSON.h"
//#import "NetworkRequestAPI.h"
#if DEBUG
//#define NSLog(...) NSLog(__VA_ARGS__)
#define NSLog(s,...) NSLog(@"%s LINE:%d < %@ >",__FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define NSLog(...) {}
#endif

#define ENABLE_APP_DEBUG YES //开启后打开debug模式

#define USEING_NETWORK YES

#define DEVICE_TOKEN @"devicetoken"
#define SAVED_TIME @"savedtime"

#define SCREEN_WIDTH (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) ? [[UIScreen mainScreen] bounds].size.width : 1024)

#define SCREEN_HEIGHT (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) ? ([[UIScreen mainScreen] bounds].size.height - 20) : 748)

#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define DOCUMENT_DIRECTORY_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

#define BUNDLE_IDENTIFIER [[NSBundle mainBundle] bundleIdentifier]


//友盟appkey
#define UMENG_APPKEY @"529410ca56240b1df309a5ea"


#define DB_PATH [DOCUMENT_DIRECTORY_PATH stringByAppendingPathComponent:@"JiuHaoDatabase.db"]

#define SCREEN_SHOT_IMG_PATH [DOCUMENT_DIRECTORY_PATH stringByAppendingPathComponent:@"screenshot.img"]

#define IS_4_INCH_SCREEN  ([[UIScreen mainScreen] bounds].size.height == 568) ? YES : NO

#define IS_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) ? YES : NO

#define BUNDLE_FILE_PATH(filename)  [[NSBundle mainBundle] pathForAuxiliaryExecutable:filename]

#define COLOR_RGB(r,g,b) [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:1]
#define COLOR_RGBA(r,g,b,a) [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:a]

#define NAV_BAR_HEIGHT 45

#define kUUID @"E2C56DB5-DFFB-48D2-B060-D0F5A71096E4"
#define kIndetifier [[NSBundle mainBundle] bundleIdentifier]
#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])


#define NUMBERS @"0123456789\n"
#define ALPHA @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"


//金色 各个字体通用
#define COLOR_GOLDEN_LIGHT COLOR_RGB(203, 168, 121)
#define COLOR_GOLDEN_DARK COLOR_RGB(208, 152, 93)

//各个label显示的颜色
#define COLOR_LABEL_TEXT COLOR_RGB(108, 100, 88)


//通用按钮颜色
#define COLOR_CUSTOM_BUTTON_BG COLOR_RGB(254, 181, 60)


#endif

