//
//  ACGCubeAttributesAnimator.m
//  acgapp
//
//  Created by Steve on 2019/10/30.
//  Copyright © 2019 iqiyi. All rights reserved.
//

#import "ACGCubeAttributesAnimator.h"
#import "UIView+CQExt.h"

@implementation ACGCubeAttributesAnimator

- (instancetype)init {
    self = [super init];
    if (self) {
        self.perspective = -1 / 500;
        self.totalAngle = M_PI / 2;
    }
    return self;
}

- (void)animate:(UICollectionView *)collectionView attributes:(ACGAnimatedCollectionViewLayoutAttributes *)attributes {
    CGFloat position = attributes.middleOffset;
    if (fabs(position) >= 1) {
        attributes.contentView.layer.transform = CATransform3DIdentity;
    } else if (attributes.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        CGFloat tmpRotateAngle = self.totalAngle * position;
//        NSLog(@"🌹 %f", position);
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = self.perspective;
        transform = CATransform3DRotate(transform, tmpRotateAngle, 0, 1, 0);
        attributes.contentView.layer.transform = transform;
        [attributes.contentView keepCenterAndApplyAnchorPoint:CGPointMake(position > 0 ? 0 : 1, 0.5)];
    } else {
        CGFloat tmpRotateAngle = self.totalAngle * position;
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = self.perspective;
        transform = CATransform3DRotate(transform, tmpRotateAngle, -1, 0, 0);
        attributes.contentView.layer.transform = transform;
        [attributes.contentView keepCenterAndApplyAnchorPoint:CGPointMake(0.5, position > 0 ? 0 : 1)];
    }
}
   
@end


