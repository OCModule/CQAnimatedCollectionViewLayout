//
//  UIView+CQExt.m
//  CQAnimatedCollectionViewLayout
//
//  Created by Steve on 2019/10/30.
//

#import "UIView+CQExt.h"


@implementation UIView (CQExt)

- (void)keepCenterAndApplyAnchorPoint: (CGPoint)point {
    CGPoint newPoint = CGPointMake(self.bounds.size.width * point.x, self.bounds.size.height * point.y);
    CGPoint oldPoint = CGPointMake(self.bounds.size.width * self.layer.anchorPoint.x, self.bounds.size.height * self.layer.anchorPoint.y);
    newPoint = CGPointApplyAffineTransform(newPoint, self.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, self.transform);
    CGPoint center = self.layer.position;
    center.x -= oldPoint.x;
    center.x += newPoint.x;
    center.y -= oldPoint.y;
    center.y += newPoint.y;
    self.layer.position = center;
    self.layer.anchorPoint = point;
}

@end
