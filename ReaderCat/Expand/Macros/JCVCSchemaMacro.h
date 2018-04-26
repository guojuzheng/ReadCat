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

#pragma mark ================= 登陆注册 =================
#define SCHEMA_LOGIN     @"/user/login"    //登录
#define SCHEMA_FORGET_PW @"/user/forgetPW" //忘记密码
#define SCHEMA_REGISTER  @"/user/register" //注册

#pragma mark ================= 首页 =================
#define SCHEMA_TAB_BAR   @"/tabbar"     //首页
#define SCHEMA_CASHIER   @"/cashier"    //收银台
#define SCHEMA_BILL      @"/bill"       //账单
#define SCHEMA_MESSAGE   @"/message"    //消息

#pragma mark ================= 分期购 =================
#define SCHEMA_EASAY_PAY      @"dripop://installment"    //花呗分期

#pragma mark ================= 店员管理 =================
#define SCHEMA_SHOP_ASSISTANT @"dripop://staffManage"    //店员管理

#pragma mark ================= 退款审核 =================
#define SCHEMA_REFUND_CHECK   @"dripop://refund"         //退款审核

#pragma mark ================= 会员卡推广 ===============
#define SCHEMA_MERBERSHIP_CARD @"dripop://grantvip"                       //会员卡推广
#pragma mark ================= 网页 =================
#define SCHEMA_WEB @"dripop://web"

#endif /* JCVcSchemaMacro_h */
