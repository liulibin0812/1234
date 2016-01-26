//
//  PushViewController.h
//  baba123
//
//  Created by DABAO on 15/12/29.
//  Copyright © 2015年 DABAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushViewController : UIViewController

// 设置本地通知
+ (void)registerLocalNotification:(NSInteger)alertTime;
+ (void)cancelLocalNotificationWithKey:(NSString *)key;
- (void)notClick;

@end
