//
//  ViewController.m
//  baba123
//
//  Created by DABAO on 15/12/21.
//  Copyright © 2015年 DABAO. All rights reserved.
//

#import "ViewController.h"
#import "YouxiViewController.h"
#import "WangLuoViewController.h"
#import "MovieViewController.h"
#import "AppDelegate.h"
#import "PushViewController.h"
#import "APPViewController.h"
#define width1 self.view.frame.size.width

#define height1 self.view.frame.size.height

@interface ViewController ()<MoviePlayerViewControllerDelegate>

@property (nonatomic,strong)MovieViewController *playController;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    

    
//    开始游戏
    UIButton*actionBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn.frame=CGRectMake(width1/3, height1/10*2, width1/3, height1/10);
    
    [actionBtn setTitle:@"开始游戏" forState:UIControlStateNormal];
    
    [actionBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn addTarget:self action:@selector(actionBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:actionBtn];
    
    //网络状态
    
    UIButton*actionBtn1=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn1.frame=CGRectMake(width1/3, height1/10*3, width1/3, height1/10);
    
    [actionBtn1 setTitle:@"网络状态" forState:UIControlStateNormal];
    
    [actionBtn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn1 addTarget:self action:@selector(actionBtnAction1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:actionBtn1];
    
    //跳转浏览器
    
    UIButton*actionBtn2=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn2.frame=CGRectMake(width1/3, height1/10*4, width1/3, height1/10);
    
    [actionBtn2 setTitle:@"跳转浏览器" forState:UIControlStateNormal];
    
    [actionBtn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn2 addTarget:self action:@selector(actionBtnAction2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:actionBtn2];

    
    //播放视频
    
    UIButton*actionBtn3=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn3.frame=CGRectMake(width1/3, height1/10*5, width1/3, height1/10);
    
    [actionBtn3 setTitle:@"播放视频" forState:UIControlStateNormal];
    
    [actionBtn3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn3 addTarget:self action:@selector(actionBtnAction3) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:actionBtn3];
    
    //退出程序
    
    UIButton*actionBtn4=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn4.frame=CGRectMake(width1/3, height1/10*6, width1/3, height1/10);
    
    [actionBtn4 setTitle:@"退出程序" forState:UIControlStateNormal];
    
    [actionBtn4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn4 addTarget:self action:@selector(actionBtnAction4) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:actionBtn4];
    
    //本地推送
    
    UIButton*actionBtn5=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn5.frame=CGRectMake(width1/3, height1/10*7, width1/3, height1/10);
    
    [actionBtn5 setTitle:@"本地推送" forState:UIControlStateNormal];
    
    [actionBtn5 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn5 addTarget:self action:@selector(actionBtnAction5) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:actionBtn5];
    
    //应用间通信
    
    UIButton*actionBtn6=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn6.frame=CGRectMake(width1/3, height1/10*8, width1/3, height1/10);
    
    [actionBtn6 setTitle:@"应用间通信" forState:UIControlStateNormal];
    
    [actionBtn6 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn6 addTarget:self action:@selector(actionBtnAction6) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:actionBtn6];
    
    
    
    
    

}
//    开始游戏
-(void)actionBtnAction{
    
    YouxiViewController*YXCtr=[[YouxiViewController alloc]init];
    [self presentViewController:YXCtr animated:YES completion:nil];

    
}
//网络状态

-(void)actionBtnAction1{
    
    WangLuoViewController*WLCtr=[[WangLuoViewController alloc]initWithNibName:@"WangLuoViewController" bundle:nil];
    
    [self presentViewController:WLCtr animated:YES completion:nil];
    
}

//跳转浏览器
-(void)actionBtnAction2{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.baidu.com/"]];
    
}

//播放视频
-(void)actionBtnAction3{
    
    _playController = [[MovieViewController alloc] init];
    _playController.delegate = self;
    _playController.url =[[NSBundle mainBundle] URLForResource:@"爸爸3测试.mp4" withExtension:nil];
    
    [self presentViewController:self.playController animated:YES completion:nil];
    
}

//退出程序
-(void)actionBtnAction4{
    
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"确定退出？" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    
    [alert show];
}
-(void)actionBtnAction5{
    PushViewController*pshVC=[[PushViewController alloc]init];
    [pshVC notClick];
//    [self presentViewController:pshVC animated:YES completion:nil];
}

-(void)actionBtnAction6{
    
//    APPViewController*app=[[APPViewController alloc]initWithNibName:@"APPViewController" bundle:nil];
//    [self presentViewController:app animated:YES completion:nil];
    
    NSString*string=@"1234567890";
//    NSString*string1=@"baba12:";
//    NSString*string2=[string1 stringByAppendingString:string];
    NSString*string2=[NSString stringWithFormat:@"baba23:%@",string];
    NSURL *url = [NSURL URLWithString:string2];
    
    
    
//        NSURL *url = [NSURL URLWithString:@"baba123:12345678"];
    [[UIApplication sharedApplication] openURL:url];
    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==0) {
        
        [self exitApplication ];
        
    }
    
    
    
}

    
- (void)exitApplication {

        AppDelegate *app1=[UIApplication sharedApplication].delegate ;
        UIWindow *window = app1.window;
    
        [UIView animateWithDuration:1.0f animations:^{
            window.alpha = 0;
            window.frame = CGRectMake(0, window.bounds.size.width, 0, 0);
        } completion:^(BOOL finished) {
            exit(0);
        }];
        //exit(0);
        
    }

    
    




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
