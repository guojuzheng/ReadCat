//
//  JCVcSchemaMacro.h
//  JupuCircle
//
//  Created by 樊星 on 2017/9/28.
//  Copyright © 2017年 樊星. All rights reserved.
//

#ifndef JCVCSchemaMacro_h
#define JCVCSchemaMacro_h

typedef enum {
    HOME_CASHIER_CLICK   = 1001,//首页点击收银台
    HOME_BILL_CLICK      = 1002,//首页点击账单
    HOME_MESSAGE_CLICK   = 1003 //首页点击消息
}HOME_CLICK;

#define URL_SCHEMA_CHARTS        @"bangdan"  //榜单
#define URL_SCHEMA_BOOKSTORE     @"bookstore"//书库
#define URL_SCHEMA_NEWEST        @"newest"   //最新
#define URL_SCHEMA_TOPPPED       @"topped"   //充值
#define URL_SCHEMA_HISTORY       @"history"  //足迹
#define URL_SCHEMA_BOOKINFO      @"bookinfo"
#define URL_SCHEMA_CHARGE        @"charge"   //免费

#endif /* JCVcSchemaMacro_h */
