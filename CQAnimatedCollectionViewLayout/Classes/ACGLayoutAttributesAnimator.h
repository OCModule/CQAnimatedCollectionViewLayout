//
//  ACGLayoutAttributesAnimator.h
//  acgapp
//
//  Created by Steve on 2019/10/30.
//  Copyright © 2019 iqiyi. All rights reserved.
//

#import "ACGAnimatedCollectionViewLayoutAttributes.h"

#ifndef ACGLayoutAttributesAnimator_h
#define ACGLayoutAttributesAnimator_h

@protocol ACGLayoutAttributesAnimator <NSObject>

- (void)animate:(UICollectionView *)collectionView attributes: (ACGAnimatedCollectionViewLayoutAttributes *)attributes;

@end

#endif /* ACGLayoutAttributesAnimator_h */
