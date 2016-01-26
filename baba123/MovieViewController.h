//
//  MovieViewController.h
//  baba123
//
//  Created by DABAO on 15/12/22.
//  Copyright © 2015年 DABAO. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MoviePlayerViewControllerDelegate <NSObject>

- (void)moviePlayerDidFinish;

//- (void)moviePlayerDidCaptureWithImage:(UIImage *)image;

@end

@interface MovieViewController : UIViewController

@property (nonatomic, weak) id <MoviePlayerViewControllerDelegate>delegate;

@property (nonatomic,strong)NSURL *url;

@end
