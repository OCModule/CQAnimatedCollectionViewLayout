//
//  CQAViewController.m
//  CQAnimatedCollectionViewLayout
//
//  Created by 王承权 on 10/30/2019.
//  Copyright (c) 2019 王承权. All rights reserved.
//

#import "CQAViewController.h"
#import "CQACollectionViewCell.h"
#import "UIColor+CQExt.h"
#import "CQAnimatedCollectionViewLayoutHeader.h"
#import "CQAnimatedCollectionViewLayout_Example-Swift.h"
#import "ACGCollectionView.h"

@interface CQAViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) ACGCollectionView *collectionView;
@property (nonatomic, strong) NSArray *datas;
@property (nonatomic, strong) AnimatedCollectionViewLayout *layout;
@property (nonatomic, assign) CGPoint lastContentOffset;

@property (nonatomic, assign) int currentPage;


@end

@implementation CQAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.currentPage = 0;
    // Do any additional setup after loading the view, typically from a nib.
    self.collectionView.frame = self.view.bounds;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CQACollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CQACollectionViewCell reuseIdentifier] forIndexPath:indexPath];
    cell.collectionView = (ACGCollectionView *)collectionView;
    cell.label.text = self.datas[indexPath.item];
    cell.backgroundColor = [UIColor greenColor];
    cell.clipsToBounds = YES;
    cell.scrollview.bounces = YES;
    self.currentPage = [@(indexPath.item) intValue];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.bounds.size.width, 600);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return CGFLOAT_MIN;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (_currentPage == 0 && scrollView.contentOffset.x < scrollView.bounds.size.width) {
//        scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width, 0);
//    } else if (_currentPage == self.datas.count-1 && scrollView.contentOffset.x > scrollView.bounds.size.width) {
//        scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width, 0);
//    }
//}
//
//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//    if (_currentPage == 0 && scrollView.contentOffset.x <= scrollView.bounds.size.width) {
//        *targetContentOffset = CGPointMake(scrollView.bounds.size.width, 0);
//    } else if (_currentPage == self.datas.count-1 && scrollView.contentOffset.x >= scrollView.bounds.size.width) {
//        *targetContentOffset = CGPointMake(scrollView.bounds.size.width, 0);
//    }
//}

#pragma mark - getter

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        CGRect frame = self.view.bounds;
        _collectionView = [[ACGCollectionView alloc] initWithFrame:frame collectionViewLayout:self.layout];
        [_collectionView registerClass:[CQACollectionViewCell class] forCellWithReuseIdentifier:[CQACollectionViewCell reuseIdentifier]];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
//        _collectionView.bounces = NO;
    }
    return _collectionView;
}

- (AnimatedCollectionViewLayout *)layout {
    if (!_layout) {
        _layout = [[AnimatedCollectionViewLayout alloc] init];
        _layout.animator = [[CubeAttributesAnimator alloc] init];
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _layout;
}

- (NSArray *)datas {
    return @[
//        @"hello",
//        @"hello",
//        @"hello",
//        @"hello",
        @"hello",
        @"hello",
        @"word"
    ];
}

@end
