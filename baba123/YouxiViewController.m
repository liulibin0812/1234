//
//  YouxiViewController.m
//  baba123
//
//  Created by DABAO on 15/12/21.
//  Copyright © 2015年 DABAO. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "YouxiViewController.h"
#import "FenXiangViewController.h"

#define width1 self.view.frame.size.width

#define height1 self.view.frame.size.height
@interface YouxiViewController ()
    {
        float a,b,m,n;
//        UIView *VW;
        UIWebView*VW;
        UIButton*actionBtn3;
        UIButton*actionBtn1;
        UIButton*actionBtn2;
        UIButton*actionBtn;
    }
@end

@implementation YouxiViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

   VW=[[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    NSURL*url=[NSURL URLWithString:@"https://www.baidu.com"];
    
    NSURLRequest*request=[NSURLRequest requestWithURL:url];
    
    
//    VW=[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//
//    VW.backgroundColor=[UIColor blueColor];
//    

    //返回
    actionBtn2=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn2.frame=CGRectMake(VW.frame.size.width/9, 10, VW.frame.size.width/9, 50);
    
    [actionBtn2 setTitle:@"退出" forState:UIControlStateNormal];
    
    [actionBtn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn2 addTarget:self action:@selector(btnConcle) forControlEvents:UIControlEventTouchUpInside];
    
    [VW addSubview:actionBtn2];

    
//比例
    actionBtn1=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn1.frame=CGRectMake(VW.frame.size.width/9*3, 10, VW.frame.size.width/9, 50);
    
    [actionBtn1 setTitle:@"75%" forState:UIControlStateNormal];
    
    [actionBtn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
     actionBtn1.tag=1;
    [actionBtn1 addTarget:self action:@selector(viewFrame:) forControlEvents:UIControlEventTouchUpInside];
    
    [VW addSubview:actionBtn1];
    
    actionBtn3=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn3.frame=CGRectMake(VW.frame.size.width/9*5, 10, VW.frame.size.width/9, 50);
    
    [actionBtn3 setTitle:@"50%" forState:UIControlStateNormal];
    
    [actionBtn3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    actionBtn3.tag=2;
    [actionBtn3 addTarget:self action:@selector(viewFrame:) forControlEvents:UIControlEventTouchUpInside];
    
    [VW addSubview:actionBtn3];
    
    actionBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    
    actionBtn.frame=CGRectMake(VW.frame.size.width/9*7, 10, VW.frame.size.width/9, 50);
    
    [actionBtn setTitle:@"截屏" forState:UIControlStateNormal];
    
    [actionBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [actionBtn addTarget:self action:@selector(clipView:) forControlEvents:UIControlEventTouchUpInside];
    [VW addSubview:actionBtn];

    
    
   
    
    self.view.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:VW];
    
    [VW loadRequest:request];


    
    
  
    
}
//返回
-(void)btnConcle{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//比例
-(void)viewFrame:(UIButton*)button{
    
    
   
    if (button.tag==1) {
        
        VW.frame=CGRectMake(width1*0.25/2,height1*0.25/2 , width1*0.75,height1*0.75);
        actionBtn.frame=CGRectMake(VW.frame.size.width/5*4-10, 10, VW.frame.size.width/5, 50);
        actionBtn1.frame=CGRectMake(VW.frame.size.width/5*2-10, 10, VW.frame.size.width/5, 50);
        actionBtn2.frame=CGRectMake(VW.frame.size.width/5-10, 10, VW.frame.size.width/5, 50);
        
        actionBtn3.frame=CGRectMake(VW.frame.size.width/5*3-10, 10, VW.frame.size.width/5, 50);
        
    } else {
        VW.frame=CGRectMake(width1*0.5/2,height1*0.5/2 , width1*0.5,height1*0.5);
        actionBtn.frame=CGRectMake(VW.frame.size.width/5*4-10, 10, VW.frame.size.width/5, 50);
        actionBtn1.frame=CGRectMake(VW.frame.size.width/5*2-20, 10, VW.frame.size.width/5+10, 50);
        actionBtn2.frame=CGRectMake(VW.frame.size.width/5-20, 10, VW.frame.size.width/5, 50);
        
        actionBtn3.frame=CGRectMake(VW.frame.size.width/5*3-15, 10, VW.frame.size.width/5+10, 50);
    }
    
    
    [self.view reloadInputViews];
    
}

-(void)clipView:(UIButton*)button{
    
    FenXiangViewController*fenXiang=[[FenXiangViewController alloc]initWithNibName:@"FenXiangViewController" bundle:nil];
    
    [self presentViewController:fenXiang animated:YES completion:nil];
    
}

// //强制横屏
//-(NSUInteger)supportedInterfaceOrientations{
//    return UIInterfaceOrientationMaskLandscape;
//}

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
