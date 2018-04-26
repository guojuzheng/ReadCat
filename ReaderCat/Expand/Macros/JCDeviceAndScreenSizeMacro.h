//
//  UtilsMacro.h
//  XHQDemo
//
//  Created by Lee on 16/3/17.
//  Copyright © 2016年 Lee. All rights reserved.
//


#pragma mark - categories

#import "AppDelegate.h"
#import "AppDelegate+UI.h"

// ======================= Device Info  ====================
#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)


#define IOS8_10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 && [[UIDevice currentDevice].systemVersion doubleValue] < 10.0)
#define IOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#define IOS11 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)
/// 第一个参数是当下的控制器适配iOS11 一下的，第二个参数表示scrollview/tableView或子类
#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}

//#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
//#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//#define SCREEN_WIDTH_SCALE SCREEN_WIDTH / 375
//#define SCREEN_HEIGHT_SCALE SCREEN_HEIGHT / 667

#define SCALE_WIDTH(width)   (width)*SCREEN_WIDTH / 375
#define SCALE_HEIGHT(height) (height)*SCREEN_HEIGHT / 667

#define NavBarHeight 64
#define TabBarHeight 49
//#define StatusBarHeight 20

#define IMAGE_PAGE_SIZE 10
#define DATA_PAGE_SIZE  25

// ================ cache folder path =================
#define CACHES_FOLDER [NSHomeDirectory() stringByAppendingPathComponent:CACHES_CATALOG]

// ======================= Image Define ====================

#define ImageNamed(_pointer) [UIImage imageNamed:_pointer]

// ======================= Font Define ====================
#define FONT(A) [UIFont systemFontOfSize:A]
#define BOLD_FONT(A) [UIFont fontWithName:@"Helvetica-Bold" size:A];

// ======================= Color Define ====================

// RGB颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 颜色(RGB)
#define RGB_COLOR(r, g, b)        [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGB_A_COLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define DEFAULT_BG_COLOR     UIColorFromRGB(0xeeeeee)
#define TEXT_GRAY_COLOR      UIColorFromRGB(0x999999)
#define CUSTOM_RED_COLOR     UIColorFromRGB(0xeb3221)
#define BOLDER_COLOR         UIColorFromRGB(0xdddddd)
#define DEFAULT_RED_COLOR    UIColorFromRGB(0xeb3221)
#define DEFAULT_BLUR_COLOR   UIColorFromRGB(0x5b95f8)
#define DEFAULT_YELLOW_COLOR UIColorFromRGB(0xff7a2b)
#define DEFAULT_GREY_COLOR   UIColorFromRGB(0x86868b)
#define LINE_COLOR           UIColorFromRGB(0xdddddd)
#define IMPORTANT_TEXT_COLOR UIColorFromRGB(0x333333)
#define REGULAR_TEXT_COLOR   UIColorFromRGB(0x666666)

// ======================= Common Define ====================
//字符串是否为空
#define IS_NULL(string) (!string || [string isEqual: @""] || (NSNull *)string == [NSNull null])
// NSUserDefaults
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

// ======================= DLog ====================
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif
// ======================= WeakSelf ====================
#define JCWeakSelf __weak typeof(self) weakSelf = self;


#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wunused-variable"



#pragma clang diagnostic pop





