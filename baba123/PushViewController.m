//
//  PushViewController.m
//  baba123
//
//  Created by DABAO on 15/12/29.
//  Copyright © 2015年 DABAO. All rights reserved.
//

#import "PushViewController.h"
#define KAlarmLocalNotificationKey @"KAlarmLocalNotificationKey"
@interface PushViewController ()

@end

@implementation PushViewController
//- (id)init
//{
//    self = [super init];
//    if (self) {
//        // Custom initialization
//        self.title = @"本地通知";
//    }
//    return self;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIButton *notBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    notBtn.frame = CGRectMake(20, 100, 320-40, 40);
//    [notBtn setBackgroundColor:[UIColor lightGrayColor]];
//    [notBtn setTitle:@"开讲啦" forState:UIControlStateNormal];
//    [notBtn addTarget:self action:@selector(notClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:notBtn];
    
}
- (void)notClick {
    NSLog(@"notBtn:%s",__FUNCTION__);
    
    [PushViewController registerLocalNotification:4];// 4秒后
}

// 设置本地通知
+ (void)registerLocalNotification:(NSInteger)alertTime {
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    // 设置触发通知的时间
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:alertTime];
    NSLog(@"fireDate=%@",fireDate);
    
    notification.fireDate = fireDate;
    // 时区
    notification.timeZone = [NSTimeZone defaultTimeZone];
    // 设置重复的间隔
    notification.repeatInterval = kCFCalendarUnitMinute;
    
    // 通知内容
    notification.alertBody =  @"您在baba123中的本地推送通知！！！";
    notification.applicationIconBadgeNumber = 1;
    // 通知被触发时播放的声音
    notification.soundName = UILocalNotificationDefaultSoundName;
    // 通知参数
    NSDictionary *userDict = [NSDictionary dictionaryWithObject:@"注意！注意！！注意！！！" forKey:@"key"];
    notification.userInfo = userDict;
    
    // ios8后，需要添加这个注册，才能得到授权
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
                                                                                 categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        // 通知重复提示的单位，可以是天、周、月
        notification.repeatInterval = NSCalendarUnitMinute;
    } else {
        // 通知重复提示的单位，可以是天、周、月
        notification.repeatInterval = NSMinuteCalendarUnit;
    }
    
    // 执行通知注册
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

// 取消某个本地推送通知
+ (void)cancelLocalNotificationWithKey:(NSString *)key {
    // 获取所有本地通知数组
    NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    
    for (UILocalNotification *notification in localNotifications) {
        NSDictionary *userInfo = notification.userInfo;
        if (userInfo) {
            // 根据设置通知参数时指定的key来获取通知参数
            NSString *info = userInfo[key];
            
            // 如果找到需要取消的通知，则取消
            if (info != nil) {
                [[UIApplication sharedApplication] cancelLocalNotification:notification];
                break;
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
