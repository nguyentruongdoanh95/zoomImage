//
//  UIImage+DoSomething.h
//  uiPinch
//
//  Created by Godfather on 6/24/17.
//  Copyright © 2017 Godfather. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DoSomething)
-(UIImage *)createImage:(CGSize)newSize radius:(CGFloat)radius byRoundingCorners:(UIRectCorner)byRoundingCorners ;
@end
