//
//  FenXiangViewController.m
//  baba123
//
//  Created by DABAO on 15/12/24.
//  Copyright © 2015年 DABAO. All rights reserved.
//

#import "FenXiangViewController.h"
#import "UIImage+ClipImage.h"
#import <ShareSDK/ShareSDK.h>
#import "WXApi.h"
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>


#import "WeiboSDK.h"
#define width1 self.view.frame.size.width

#define height1 self.view.frame.size.height

@interface FenXiangViewController ()
{
    ShareType*type;
}
@property (weak, nonatomic) IBOutlet UIImageView *jieTuImageView;

@end

@implementation FenXiangViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     
}
- (IBAction)shareAction:(id)sender {
    
    UIView*view=[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor=[UIColor whiteColor];
    UIButton*actionBtn6=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn6.frame=CGRectMake(10, 20, 30, 30);
    
    [actionBtn6 setTitle:@"返回" forState:UIControlStateNormal];
    
    [actionBtn6 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn6 addTarget:self action:@selector(goBackAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:actionBtn6];

    //    开始游戏
    UIButton*actionBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn.frame=CGRectMake(width1/3, height1/10*2, width1/3, height1/10);
    actionBtn.tag=0;
    [actionBtn setTitle:@"微博" forState:UIControlStateNormal];
    
    [actionBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn addTarget:self action:@selector(actionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:actionBtn];
    
    //网络状态
    
    UIButton*actionBtn1=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn1.frame=CGRectMake(width1/3, height1/10*3, width1/3, height1/10);
    actionBtn1.tag=1;
    [actionBtn1 setTitle:@"微信" forState:UIControlStateNormal];
    
    [actionBtn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn1 addTarget:self action:@selector(actionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:actionBtn1];
    
    //跳转浏览器
    
    UIButton*actionBtn2=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn2.frame=CGRectMake(width1/3, height1/10*4, width1/3, height1/10);
    actionBtn2.tag=2;
    [actionBtn2 setTitle:@"朋友圈" forState:UIControlStateNormal];
    
    [actionBtn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn2 addTarget:self action:@selector(actionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:actionBtn2];
    
    
    //播放视频
    
    UIButton*actionBtn3=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn3.frame=CGRectMake(width1/3, height1/10*5, width1/3, height1/10);
    actionBtn3.tag=3;
    [actionBtn3 setTitle:@"qq" forState:UIControlStateNormal];
    
    [actionBtn3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn3 addTarget:self action:@selector(actionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:actionBtn3];
    
    //退出程序
    
    UIButton*actionBtn4=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn4.frame=CGRectMake(width1/3, height1/10*6, width1/3, height1/10);
    actionBtn4.tag=4;
    [actionBtn4 setTitle:@"qq空间" forState:UIControlStateNormal];
    
    [actionBtn4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn4 addTarget:self action:@selector(actionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:actionBtn4];
    
    


    
    
    
    
    
    
    [self.view addSubview:view];
    
    
    NSLog(@"分享&＊＊＊＊＊＊＊＊＊＊＊＊");
    
    
}
-(void)actionBtnAction:(UIButton*)button{
    
    int typeNum=(int)button.tag;
    
    [self shareTypeNum:typeNum Title:@"123" content:@"HAOHAOWANdfsgdsfghdzdfhsdfhcvhdsfzdsgszdfhzcxbvzdxfgzdfbzxfgzfhbxzdfgzdfxgdfh" imagePath:nil url:@"http://www.baidu.com"];
    
}
- (IBAction)jieTuAction:(id)sender {
    
    UIView*aView=self.jieTuImageView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage*image=[UIImage captureWithView:aView];
        
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
        
        
    });

    
    
}
-(void)shareTypeNum:(int)typeNum Title:(NSString *)title content:(NSString *)content imagePath:(NSString *)imagePath url:(NSString *)targetUrl{
    
    
    
    
    if (typeNum==0) {
        type=ShareTypeSinaWeibo;
        NSLog(@"分享&＊＊＊＊＊＊＊＊＊＊＊＊ShareTypeSinaWeibo");
    }else if (typeNum==1){
        type=ShareTypeWeixiSession;
        NSLog(@"分享&＊＊＊＊＊＊＊＊＊＊＊＊ShareTypeWeixiSession");
    }else if (typeNum==2){
        type=ShareTypeWeixiTimeline;
        NSLog(@"分享&＊＊＊＊＊＊＊＊＊＊＊＊ShareTypeWeixiTimeline");
    }else if (typeNum==3){
        type=ShareTypeQQ;
        NSLog(@"分享&＊＊＊＊＊＊＊＊＊＊＊＊ShareTypeQQ");
    }else if (typeNum==4){
        
        type=ShareTypeQQSpace;
        NSLog(@"分享&＊＊＊＊＊＊＊＊＊＊＊＊ShareTypeQQSpace");
    }
    
    NSString *imagePath1 = [[NSBundle mainBundle] pathForResource:@"Taidi" ofType:@"jpg"];
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:content
                                       defaultContent:content
                                                image:[ShareSDK imageWithPath:imagePath1]
                                                title:title
                                                  url:targetUrl
                                          description:content
                                            mediaType:SSPublishContentMediaTypeNews];
    [ShareSDK clientShareContent:publishContent
                            type:type
                   statusBarTips:YES
                          result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                              
                              if (state == SSPublishContentStateSuccess)
                              {
                                  NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功!"));
                                                               }
                              else if (state == SSPublishContentStateFail)
                              {
                                  NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败!"), [error errorCode], [error errorDescription]);
                                  
                              }
                          }];
    
}
- (IBAction)goBackAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES  completion:nil];
    
    
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
