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

@end

@implementation CQACollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
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
    NSArray<NSString *> *texts = @[
//    @"1",
    @"2",
    @"3",
    ];
    for (NSInteger i = 0; i < texts.count; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor randomColor];
        label.textColor = [UIColor blackColor];
        label.text = texts[i];
        label.frame = CGRectMake(i * w, 0, w, 200);
        [self.scrollview addSubview:label];
    }
//    [self.scrollview setContentOffset:CGPointMake(-10, 0)];
    self.scrollview.pagingEnabled = YES;
    self.scrollview.contentSize = CGSizeMake(w * texts.count, 0);
    self.scrollview.bounces = YES;
//    [pan addTarget:self action:@selector(handlePan:)];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.scrollview];
    self.contentView.backgroundColor = [UIColor randomColor];
}

- (void)setCollectionView:(ACGCollectionView *)collectionView {
    _collectionView = collectionView;
}

- (void)handlePan:(id)sender {
    
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

@end
