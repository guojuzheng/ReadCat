//
//  LoginView.h
//  ReaderCat
//
//  Created by guojz on 2018/4/3.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
#import "RCInputView.h"

@interface LoginView : BaseView
@property (nonatomic, strong)UIImageView        *appIcon;
@property (nonatomic, strong)UILabel            *appName;
@property (nonatomic, strong)RCInputView        *userName;
@property (nonatomic, strong)RCInputView        *password;
@property (nonatomic, strong)QMUIButton         *remberMe;
@property (nonatomic, strong)QMUIButton         *forwordPw;
@property (nonatomic, strong)QMUIFillButton     *registerBtn;
@property (nonatomic, strong)QMUIFillButton     *loginBtn;
@end
