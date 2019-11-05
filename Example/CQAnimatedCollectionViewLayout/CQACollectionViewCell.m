//
//  CQACollectionViewCell.m
//  CQAnimatedCollectionViewLayout_Example
//
//  Created by Steve on 2019/10/30.
//  Copyright © 2019 王承权. All rights reserved.
//

#import "CQACollectionViewCell.h"
#import "UIColor+CQExt.h"
#import "ACGCollectionView.h"
#import <MJRefresh/MJRefresh.h>

@interface CQACollectionViewCell()<UIScrollViewDelegate>

@property (nonatomic, assign) CGPoint lastContentOffset;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, copy) NSArray *datas;

@end

@implementation CQACollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.firstItem = NO;
        self.lastItem = NO;
        [self addComponents];
    }
    return self;
}

- (void)addComponents {
    CGFloat w = 414;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, w, 100)];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor blackColor];
    self.label.backgroundColor = [UIColor whiteColor];
    self.label.backgroundColor = [UIColor randomColor];
    self.scrollview = [[ACGScrollView alloc] initWithFrame:CGRectMake(0, 120, w, 200)];
    self.scrollview.userInteractionEnabled = YES;
    self.scrollview.alwaysBounceHorizontal = YES;
    self.scrollview.delegate = self;
    self.scrollview.backgroundColor = [UIColor grayColor];
    for (NSInteger i = 0; i < self.datas.count; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor randomColor];
        label.textColor = [UIColor blackColor];
        label.text = self.datas[i];
        label.frame = CGRectMake(i * w, 0, w, 200);
        [self.scrollview addSubview:label];
    }
    self.currentIndex = 0;
//    [self.scrollview setContentOffset:CGPointMake(-10, 0)];
    [self.scrollview setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    self.scrollview.pagingEnabled = YES;
    self.scrollview.contentSize = CGSizeMake(w * self.datas.count, 0);
//    self.scrollview.bounces = NO;
//    [pan addTarget:self action:@selector(handlePan:)];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.scrollview];
    self.contentView.backgroundColor = [UIColor randomColor];
}

- (void)adapterContentInset: (NSIndexPath *)indexPath items: (NSArray *)items {
    self.firstItem = indexPath.item == 0;
    self.lastItem = indexPath.item == (items.count - 1);
    if (self.firstItem) {
//        self.scrollview.bounces = YES;
        [self.scrollview setContentInset:UIEdgeInsetsMake(0, 1, 0, 0)];
    } else if (self.lastItem) {
//        self.scrollview.bounces = YES;
        [self.scrollview setContentInset:UIEdgeInsetsMake(0, 0, 0, 1)];
    } else {
//        self.scrollview.bounces = NO;
        [self.scrollview setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}

- (void)setCollectionView:(ACGCollectionView *)collectionView {
    _collectionView = collectionView;
}

- (void)handlePan:(id)sender {
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.currentIndex = scrollView.contentOffset.x / scrollView.frame.size.width;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    scrollView.contentOffset = CGPointMake(self.currentIndex * scrollView.bounds.size.width, 0);
}

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    if ([hitView isKindOfClass:[UICollectionView class]]) {
        return nil;
    }
    return hitView;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return [super pointInside:point withEvent:event];
}

- (NSArray *)datas {
    return @[
    //    @"1",
        @"2",
        @"3",
        ];
}

@end
