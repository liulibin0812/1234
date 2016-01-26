//
//  UIImage+ClipImage.h
//  截取屏幕
//
//  Created by Mac on 15/7/7.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ClipImage)
+ (instancetype)captureWithView:(UIView *)aView;
@end
