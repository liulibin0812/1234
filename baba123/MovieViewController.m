//
//  MovieViewController.m
//  baba123
//
//  Created by DABAO on 15/12/22.
//  Copyright © 2015年 DABAO. All rights reserved.
//

#import "MovieViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface MovieViewController ()<UIAlertViewDelegate>

//视频播放器
@property (nonatomic,strong)MPMoviePlayerController *moviePlayer;


@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:self.url];
    
    //设置大小
    _moviePlayer.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height); //self.view.bounds;
    _moviePlayer.controlStyle=MPMovieControlStyleEmbedded;
    _moviePlayer.scalingMode =  MPMovieScalingModeAspectFill;
    //    [_moviePlayer setFullscreen:YES animated:YES];
    
    //设置横屏
    //    _moviePlayer.view.autoresizingMask =UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_moviePlayer.view];
    
    
    self.moviePlayer.fullscreen = YES;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    
    //？返回上一级的思路：done / 媒体播放结束了，回到上一级窗口（代理，通知）
    [self addNotification];

    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //    self.moviePlayer.fullscreen = YES;
}

/**
 *  添加通知
 */
- (void)addNotification
{
    
    //监听状态
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter] ;
    [center addObserver:self selector:@selector(stateChanged) name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
    
    //监听完成
    [center addObserver:self selector:@selector(finished) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    
    //数组中有多少个秒，就发几个通知
    //MPMovieTimeOptionExact,精确
    
    [self.moviePlayer requestThumbnailImagesAtTimes:@[@(5.0),@(10.9)] timeOption:MPMovieTimeOptionExact];
    
    
}

/**
 *  视频播放完成退出播放界面
 */
- (void)finished
{
    
        //删除通知
//        [[NSNotificationCenter defaultCenter] removeObserver:self];
        NSLog(@"完成");
        UIAlertView*alertV=[[UIAlertView alloc]initWithTitle:@"提示" message:@"退出播放？" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    
        [alertV show];
    
    
        

}

- (void)stateChanged
{
    switch (self.moviePlayer.playbackState) {
            
        case MPMoviePlaybackStateStopped:
            NSLog(@"停止");
            break;
            
        case MPMoviePlaybackStatePlaying:
            NSLog(@"播放");
            break;
            
        case MPMoviePlaybackStatePaused:
            NSLog(@"暂停");
            
            break;
            
        default:
            break;
            
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        
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
