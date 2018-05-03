//
//  UIView+Category.m
//  ReaderCat
//
//  Created by guojz on 2018/4/27.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)
- (UIViewController*)getViewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
@end
