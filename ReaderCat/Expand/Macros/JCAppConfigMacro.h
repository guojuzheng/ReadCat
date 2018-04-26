//
//  AppMacro.h
//  XHQDemor
//
//  Created by Lee on 16/3/17.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "JCFileReadAndWriteManager.h"

 

#pragma mark ================= configuration info =================

#define CACHES_CATALOG [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"Configuration"] objectForKey:@"caches_catalog"]
#define LC_ACTIVITY_H5_VERSION [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"Configuration"] objectForKey:@"activity_h5_version"]
#define LC_WEBSOCKET_SCHEME [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"Configuration"] objectForKey:@"websocket_schema"]
#define LC_APP_KEY [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"Configuration"] objectForKey:@"app_key"]
#define LC_AUTH_APP_KEY [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"Configuration"] objectForKey:@"auth_app_key"]
#define LC_DEFAULT_TOKEN [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"Configuration"] objectForKey:@"defalut_token"]
#define UMENG_APP_KEY [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"Configuration"] objectForKey:@"UMeng_app_key"]
#define WX_APP_ID [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"Configuration"] objectForKey:@"WXAppId"]
#define WX_APP_SECRET [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"Configuration"] objectForKey:@"WXAppSecret"]
#define QQ_APP_ID [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"Configuration"] objectForKey:@"QQAppId"]
#define QQ_APP_KEY [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"Configuration"] objectForKey:@"QQAppSecret"]
#define QQ_APP_URL [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"Configuration"] objectForKey:@"QQAppUrl"]
#define API_KEY [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"Configuration"] objectForKey:@"mapKey"]

#define APP_SCHEMA [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"Configuration"] objectForKey:@"appSchema"]

#pragma mark ================= key =================

#define USER_INFO          @"userInfo"
#define USER_ID            @"userId"

#define TOKEN              @"token"
#define TIME_DIF           @"timeDif"

#define STORED_IGNORED_APP_VERSION_LIST            @"storedIgnoredAppVersionList"

#define BUGLY_APPID        @"700cb7edfe"

#define GTAPPID            @"6GxXBfaYcv61Jui5xQQHj3"
#define GTAPPKEY           @"bkoWeeulwu5AV4d63rsNU8"
#define GTAPPSECRET        @"6SpDzq4y7S6Zok5gz3njI4"

#define BDTTSAPPID         @"10613531"
#define BDTTSAPPKEY        @"nbRnygDYH14NPC2rHaGxHEqn"
#define BDTTSAPPSECRET     @"c1ed5d69b72895757392db7ae137ba07"

#define KEYCHAINSERVICE           @"com.jupu.JupuCircle.keychain"

#define PAYVOICESWITCH     @"payVoiceSwitch"
//1 微信好友 2 微信朋友圈 3 QQ好友 4 新浪微博
typedef NS_ENUM(NSUInteger, ShareChannel){
    WechatSession = 1,
    WechatTimeline = 2,
    QQ = 3,
    Sina = 4,
};

//支付模型
typedef enum PayModel{
    AliPay    = 1, //支付宝
    WechatPay = 2, //微信
    HuaBeiPay  = 3  //花呗
}PayModel;

#pragma mark ================= Picture Define =================

#define DEFAULT_FACE      @"home_default_face"
#define DEFAULT_GOODS     @"default_goods"

#pragma mark ================= String Define =================

#define TEST_STRING       @""//@"测试文本样式"
#define DEFAULT_IMAGE     @"home_function_placeholder"

//是否为空或是[NSNull null]
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))


//Socket通知类型
#define SOCKET_SCAN @"socketScan"



