//
//  WangLuoViewController.m
//  baba123
//
//  Created by DABAO on 15/12/22.
//  Copyright © 2015年 DABAO. All rights reserved.
//

#import "WangLuoViewController.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
//#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability/Reachability.h"


@interface WangLuoViewController ()
{
    NSString*netWorkType;
    
    NSString*serverLabel;
    
    Reachability *_networkConn;
//    UIView*alertView;
}
@end

@implementation WangLuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateChange) name:kReachabilityChangedNotification object:nil];
    _networkConn = [Reachability reachabilityForInternetConnection];
    [_networkConn startNotifier];
    
    
}

- (BOOL)isNetworkEnable
{
    BOOL flag = YES;
    Reachability *r = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            flag = NO;
            break;
        case ReachableViaWWAN:
            break;
        case ReachableViaWiFi:
            break;
            
        default:
            break;
    }
    
    return flag;
}
- (void)networkStateChange
{
    
    if ([[self networktype] isEqual:@"无服务"]) {
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"没网络信号了！！！" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert show];
        
    } else if([[self networktype] isEqual:@"Wifi"])  {
        
        UIAlertView*alert1=[[UIAlertView alloc]initWithTitle:@"提示" message:@"网络信号为Wifi，可以尽情所欲的玩耍了！！！" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert1 show];
        
    }else if([[self networktype] isEqual:@"2G"])  {
        
        UIAlertView*alert2=[[UIAlertView alloc]initWithTitle:@"提示" message:@"网络信号为2G，请注意流量使用！！！" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert2 show];
        
    }else if([[self networktype] isEqual:@"3G"])  {
        
        UIAlertView*alert3=[[UIAlertView alloc]initWithTitle:@"提示" message:@"网络信号为3G，请注意流量使用！！！" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert3 show];
        
    }else if([[self networktype] isEqual:@"4G"])  {
        
        UIAlertView*alert4=[[UIAlertView alloc]initWithTitle:@"提示" message:@"网络信号为4G，请注意流量使用！！！" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert4 show];
        
    }else {
        
        UIAlertView*alert5=[[UIAlertView alloc]initWithTitle:@"提示" message:@"网络信号为LTE，可以尽情所欲的玩耍了！！！" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert5 show];
    }
    
    
    if ([self isNetworkEnable]) {
        _internetlabel.text=@"可用";
    }else{
        _internetlabel.text=@"不可用";
    }
    
    _internetfans.text=[self networktype];
    
    _internetagent.text=[self getcarrierName];

    
}

- (IBAction)startAction:(id)sender {
    
    _internetfans.text=[self networktype];
    
    _internetagent.text=[self getcarrierName];
    
    [self networkStateChange];

//    if ([self isNetworkEnable]) {
//        _internetlabel.text=@"可用";
//    }else{
//        _internetlabel.text=@"不可用";
//    }

    
}
-(NSString*)networktype{
    
    NSArray *subviews = [[[[UIApplication sharedApplication] valueForKey:@"statusBar"] valueForKey:@"foregroundView"]subviews];
    
    NSNumber *dataNetworkItemView = nil;
    
    for (id subview in subviews) {
        
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            
            dataNetworkItemView = subview;
            
            break;
        }
    }
    
    switch ([[dataNetworkItemView valueForKey:@"dataNetworkType"]integerValue]) {
            
        case 0:
            
            NSLog(@"No wifi or cellular");
            
            netWorkType=@"无服务";
            
            break;
            
        case 1:
            
            NSLog(@"2G");
            
            netWorkType=@"2G";
            
            break;
            
        case 2:
            
            NSLog(@"3G");
            
            netWorkType=@"3G";
            
            break;
            
        case 3:
            
            NSLog(@"4G");
            
            netWorkType=@"4G";
            
            break;
            
        case 4:
            
            NSLog(@"LTE");
            
            netWorkType=@"LTE";
            
            break;
            
        case 5:
            
            NSLog(@"Wifi");
            
            netWorkType=@"Wifi";
            
            break;
            
            
        default:
            break;
    }
    
//    NSString*m=@"无服务";
//    
//    if (netWorkType==m) {
//        
//        _internetlabel.text=@"不可用";
//        
//        _internetlabel.textColor=[UIColor redColor];
//        
//        _internetfans.textColor=[UIColor redColor];
//        
//    } else {
//        
//        _internetlabel.text=@"可用";
//        
//        _internetlabel.textColor=[UIColor blueColor];
//        
//        _internetfans.textColor=[UIColor blueColor];
//    }
    return netWorkType;
    
}
-(NSString*)getcarrierName{
    
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
    
    NSString *currentCountry=[carrier carrierName];
    
    NSLog(@"[carrier isoCountryCode]==%@,[carrier allowsVOIP]=%d,[carrier mobileCountryCode=%@,[carrier mobileCountryCode]=%@",[carrier isoCountryCode],[carrier allowsVOIP],[carrier mobileCountryCode],[carrier mobileNetworkCode]);
    
//    serverLabel=currentCountry;
    
    NSString*currentCountry1=@"无网络运营商";
    
    if (currentCountry==nil) {
        
        serverLabel=currentCountry1;
        
        _internetagent.textColor=[UIColor redColor];
        
    } else {
        
        serverLabel=currentCountry;
        
        _internetagent.textColor=[UIColor blueColor];
        
    }
    
    return serverLabel;
}
- (IBAction)btnConcle:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
