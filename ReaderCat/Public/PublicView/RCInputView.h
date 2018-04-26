//
//  RCInputView.h
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"

@interface RCInputView : BaseView
@property (nonatomic, strong) UIImageView *leftImage;
@property (nonatomic, strong) UITextField *inputtextfield;
@property (nonatomic, strong) UIView      *lineView;
-(void)setLeftImage:(NSString *)leftImage placeHolder:(NSString *)placeHolder;
@end
