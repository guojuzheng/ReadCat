//
//  CustomCollectionViewFlowLayout.h
//  ETong
//
//  Created by Remmo on 16/12/21.
//  Copyright © 2016年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 扩展section的背景色
@protocol CustomCollectionViewDelegateFlowLayout <UICollectionViewDelegateFlowLayout>

- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout colorForSectionAtIndex:(NSInteger)section;

@end


@interface CustomCollectionViewFlowLayout : UICollectionViewFlowLayout

@end
