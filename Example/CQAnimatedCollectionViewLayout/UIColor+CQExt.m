//
//  UIColor+CQExt.m
//  CQAnimatedCollectionViewLayout_Example
//
//  Created by Steve on 2019/10/30.
//  Copyright © 2019 王承权. All rights reserved.
//

#import "UIColor+CQExt.h"


@implementation UIColor (CQExt)

+ (UIColor *)randomColor {
    //  0.0 to 1.0
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    //  0.5 to 1.0, away from white
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    //  0.5 to 1.0, away from black
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
