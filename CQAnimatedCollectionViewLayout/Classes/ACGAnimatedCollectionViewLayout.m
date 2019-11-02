//
//  ACGAnimatedCollectionViewLayout.m
//  acgapp
//
//  Created by Steve on 2019/10/30.
//  Copyright © 2019 iqiyi. All rights reserved.
//

#import "ACGAnimatedCollectionViewLayout.h"

@implementation ACGAnimatedCollectionViewLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray<UICollectionViewLayoutAttributes *> *array = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray<UICollectionViewLayoutAttributes *> *retArr = [NSMutableArray array];
//    attributes.map { self.transformLayoutAttributes($0.copy() as! ACGAnimatedCollectionViewLayoutAttributes) }
    for (ACGAnimatedCollectionViewLayoutAttributes *attributes in array) {
        UICollectionViewLayoutAttributes *temp = [self transformLayoutAttributes:[attributes copy]];
        [retArr addObject:temp];
    }
    return [retArr copy];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    ACGAnimatedCollectionViewLayoutAttributes *attributes = (ACGAnimatedCollectionViewLayoutAttributes *)[super layoutAttributesForItemAtIndexPath:indexPath];
    return [self transformLayoutAttributes:attributes];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (UICollectionViewLayoutAttributes *)transformLayoutAttributes: (ACGAnimatedCollectionViewLayoutAttributes *) attributes {
    UICollectionView *collectionView = self.collectionView;
    if (collectionView == nil) {
        return attributes;
    }
    CGFloat distance;
    CGFloat itemOffset;
    ACGAnimatedCollectionViewLayoutAttributes *attr = attributes;
    if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        distance = collectionView.frame.size.width;
        itemOffset = attr.center.x - collectionView.contentOffset.x;
//        attr.startOffset = (attr.frame.origin.x - collectionView.contentOffset.x) / attr.frame.size.width;
//        attr.endOffset = (attr.frame.origin.x - collectionView.contentOffset.x - collectionView.frame.size.width) / attr.frame.size.width;
    } else {
        distance = collectionView.frame.size.height;
        itemOffset = attr.center.y - collectionView.contentOffset.y;
        attr.startOffset = (attr.frame.origin.y - collectionView.contentOffset.y) / attr.frame.size.height;
        attr.endOffset = (attr.frame.origin.y - collectionView.contentOffset.y - collectionView.frame.size.height) / attr.frame.size.height;
    }
    attr.scrollDirection = self.scrollDirection;
    attr.middleOffset = itemOffset / distance - 0.5;
     NSLog(@"🌹attr.middleOffset: %f", attr.middleOffset);
    UIView *contentView = [collectionView cellForItemAtIndexPath:attr.indexPath].contentView;
    if (attr.contentView == nil) {
        attr.contentView = contentView;
    }
    [self.animator animate:collectionView attributes:attr];
    return attr;
}

+ (Class)layoutAttributesClass {
    return [ACGAnimatedCollectionViewLayoutAttributes class];
}

@end
