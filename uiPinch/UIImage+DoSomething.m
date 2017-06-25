//
//  UIImage+DoSomething.m
//  uiPinch
//
//  Created by Godfather on 6/24/17.
//  Copyright © 2017 Godfather. All rights reserved.
//

#import "UIImage+DoSomething.h"

@implementation UIImage (DoSomething)

-(UIImage *)createImage:(CGSize)newSize radius:(CGFloat)radius byRoundingCorners:(UIRectCorner)byRoundingCorners {
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
    CGRect imgRect = CGRectMake(0, 0, newSize.width, newSize.height);
    if (!byRoundingCorners) {
        [[UIBezierPath bezierPathWithRoundedRect:imgRect byRoundingCorners:byRoundingCorners cornerRadii:CGSizeMake(radius, radius)] addClip];
    } else {
        [[UIBezierPath bezierPathWithRoundedRect:imgRect cornerRadius:radius] addClip];
    }
    [self drawInRect:imgRect];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}
@end
