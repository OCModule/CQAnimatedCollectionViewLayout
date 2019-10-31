//
//  ACGAnimatedCollectionViewLayoutAttributes.h
//  acgapp
//
//  Created by Steve on 2019/10/30.
//  Copyright © 2019 iqiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACGAnimatedCollectionViewLayoutAttributes : UICollectionViewLayoutAttributes<NSCopying>

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;
@property (nonatomic, assign) CGFloat startOffset;
@property (nonatomic, assign) CGFloat middleOffset;
@property (nonatomic, assign) CGFloat endOffset;

@end

NS_ASSUME_NONNULL_END
