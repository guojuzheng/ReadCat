//
//  URLMacro.h
//  LittleCircle
//
//  Created by Lee on 16/3/24.
//  Copyright © 2016年 trioly.com. All rights reserved.
// 

#import "JCFileReadAndWriteManager.h"

#define ENVIRONMENT  @"test" //dis(生产环境) test(测试环境) dev(开发环境) local(本地)

#define DEV_ENV ([ENVIRONMENT isEqualToString:@"dev"])

#define DIS_ENV ([ENVIRONMENT isEqualToString:@"dis"])

#define JC_SERVER_ADDRESS [[[JCFileReadAndWriteManager sharedAnimationCheckManager] readFromBundleFile:@"JCAppConfiguration"] objectForKey:Str(@"%@_server_url", ENVIRONMENT)]

//首页
#define URL_HOME_INDEX             @"/index"                      //首页数据接口

//注册登录
#define URL_LOGIN                  @"/open/login"                 //普通登录
#define URL_REGISTER_VALID         @"/open/registerValid"         //注册下一步校验
#define URL_REGISTER               @"/open/register"              //注册
#define URL_DYNAMIC_LOGIN          @"/open/dynamicLogin"          //动态密码登录
#define URL_FORGETPW_MODIFY        @"/open/forgetPwd"             //忘记密码-修改密码接口
#define URL_GET_POSITION_INFO      @"/open/departmentPostList"    //部门类型下的岗位信息接口
#define URL_COMPANY_CHECK          @"/open/registerCheck"         //公司和部门校验
#define URL_COMPANY_AND_POSITION   @"/open/managerDepartmentAndPost" //公司及职位信息接口
#define URL_NEW_GEGISTER           @"/open/pageRegister"            //新增注册用户注册接口
//个人
#define URL_MODIFYPW               @"/tobUser/modifyPwd"          //修改密码接口
#define URL_ROLE_CHANGE            @"/tobUser/roleChange"         //切换角色
#define URL_UPLOAD_HEADPIC         @"/tobUser/uploadFile"         //修改头像
#define URL_USERINFO_UPDATE        @"/tobUser/updateEmployeeInfo" //修改员工基本信息
#define URL_COMPANY_NOTICE_LIST    @"/notice/companyNoticeList"   //公司公告列表
#define URL_ABOUT_CIRCLE           @"/tobUser/aboutOur"           //关于瀑布圈子

//消息中心
#define URL_MESSAGE_LIST           @"/msg/list"                   //消息中心列表

//员工管理
#define URL_EMPLOYEE_LIST          @"/tobUser/userList"           //员工管理
#define URL_EMPLOYEE_DETAIL        @"/tobUser/detail"             //员工详情
#define URL_EMPLOYEE_STOP_HIRE     @"/tobUser/tobOper"            //停用员工
#define URL_EMPLOYEE_CHECK_LIST    @"/tobUser/pendingUserList"    //员工审核列表
#define URL_EMPLOYEE_LIST_NEW      @"/tobUser/newUserList"        //员工管理

//公共
#define URL_GET_PHONE_CODE         @"/open/code"                  //获取验证码
#define URL_CHECK_UPDATE           @"/open/checkUpdate"           //检查更新
#define URL_UPLOAD_TOKEN           @"/open/tokenLogin"            //token登录

//分期购
#define URL_EASY_PAY_WIHT_MONEY    @"/staging/stagingItem"        //根据金额获得对应的分期信息
#define URL_CREAT_EASY_PAY_IMAGE   @"/staging/payCode"            //生成分期支付二维码
#define URL_QUERY_PAY_RESULT       @"/staging/queryPayResult"     //刷新支付结果接口
#define URL_EASY_PAY_STAGING_NOTIC @"/staging/periods"            //分期期数提示

//账单明细
#define URL_GET_BILL_LIST          @"/order/billDetailList"       //账单明细列表
#define URL_GET_BILL_DETAIL        @"/order/orderDetail"          //账单详情
#define URL_BILL_REFUND_MONEY      @"/order/orderRefund"          //账单申请退款
#define URL_BILL_CANCEL_REFUND     @"/order/cancelOrderRefund"    //账单取消申请退款

//收银台
#define URL_CASHIER_CREATE_ORDER   @"/order/mybankPayQrCode"      //收银台创建订单
#define URL_CASHIER_SEARCH_ORDER   @"/order/mybankPayQuery"       //收银台订单查询
#define URL_CASHIER_AUTO_CHECK     @"/order/orderSync"            //收银台自动查询收银

//退款审核
#define URL_REFUND_CHECK_LIST      @"/order/refundAuditList"      //退款审核列表
#define URL_REFUND_CHECK_DETAIL    @"/order/refundDetail"         //退款单详情
#define URL_REFUND_CHECK_ACTION    @"/order/refundAudit"          //退款审核通过/拒绝

//会员卡
#define URL_MERBERSHIPCARD_GET     @"/card/getCardSpreadInfo"     //获取推广会员卡
#define URL_MERBERSHIPCARD_CASHIER @"/card/getMemberCardOper"     //收银台会员卡权限
#define URL_MERBERSHIPCARD_INFO    @"/card/getMemberCardInfo"     //收银台/花呗分期会员卡信息


typedef enum RequestStatus{
    NETWORK_ERROR         = 100,  //网络未连接
    REQUEST_TOKEN_INVALID = 499,  //token失效
    REQUEST_STATUS_OK     = 200,  //请求成功
    REQUEST_STATUS_FAIL   = 500   //请求失败
}RequestStatus;

