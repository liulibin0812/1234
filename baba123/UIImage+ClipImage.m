//
//  UIImage+ClipImage.m
//  截取屏幕
//
//  Created by Mac on 15/7/7.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "UIImage+ClipImage.h"

@implementation UIImage (ClipImage)
+ (instancetype)captureWithView:(UIView *)aView
{
    
    //1.开启位图的上下文
    UIGraphicsBeginImageContextWithOptions(aView.frame.size, NO, 0.0);
    //2.将aView的Layer渲染到上下文中
    [aView.layer renderInContext:UIGraphicsGetCurrentContext()];
    //3.取出上下文中得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //4.结束上下文
    UIGraphicsEndImageContext();
    
    return image;

}
@end
