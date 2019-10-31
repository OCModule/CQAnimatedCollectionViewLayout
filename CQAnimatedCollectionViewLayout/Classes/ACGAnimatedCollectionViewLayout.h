//
//  ACGAnimatedCollectionViewLayout.h
//  acgapp
//
//  Created by Steve on 2019/10/30.
//  Copyright © 2019 iqiyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACGLayoutAttributesAnimator.h"
#import "ACGAnimatedCollectionViewLayoutAttributes.h"

NS_ASSUME_NONNULL_BEGIN

@interface ACGAnimatedCollectionViewLayout : UICollectionViewFlowLayout

@property (nonatomic, strong) CubeAttributesAnimator *animator;


@end

NS_ASSUME_NONNULL_END
