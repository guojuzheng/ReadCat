//
//  BaseCell.m
//  JupuCircle
//
//  Created by 樊星 on 2017/10/9.
//  Copyright © 2017年 樊星. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self defaultConfig];
        [self configSubView];
    }
    return self;
}

-(void)defaultConfig{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)configSubView{
}
@end
