//
//  ACGCollectionView.m
//  CQAnimatedCollectionViewLayout_Example
//
//  Created by Steve on 2019/11/1.
//  Copyright © 2019 王承权. All rights reserved.
//

#import "ACGCollectionView.h"

@interface ACGCollectionView()

@end

@implementation ACGCollectionView


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
//        self.bounces = NO;
//        self.pan = self.panGestureRecognizer;
//        [self.pan addTarget:self action:@selector(handlePan:)];
    }
    return self;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView.contentOffset.x <= 0 || (scrollView.contentSize.width - self.frame.size.width) <= scrollView.contentOffset.x) {
//        self.pan.state = UIGestureRecognizerStateCancelled;
//    }
//}

//- (void)handlePan:(id)sender {
//
//}
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    UIView *hitView = [super hitTest:point withEvent:event];
//    if ([hitView isKindOfClass:[UICollectionView class]]) {
//        for (<#type *object#> in <#collection#>) {
//            <#statements#>
//        }
//        return nil;
//    }
//    return hitView;
//}


//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    if (self.contentOffset.x <= 0) {
//        [self resignFirstResponder];
//    }
//    if (self.contentOffset.x >= (self.contentSize.width - self.frame.size.width)) {
//        [self resignFirstResponder];
//    }
//    return [super pointInside:point withEvent:event];
//}

@end
