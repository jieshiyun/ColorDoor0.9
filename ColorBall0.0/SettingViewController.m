//
//  SettingViewController.m
//  ColorBall0.0
//
//  Created by jie on 17/2/24.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "SettingViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *backgroundMusicButton;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.backgroundMusicButton addTarget:self action:@selector(transform:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)back: (id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)transform: (id)sender{
    AppDelegate *ad = [[UIApplication sharedApplication] delegate];
    if(ad.playMusic.isPlaying){
        [self.backgroundMusicButton setTitle:@"background music: on" forState:UIControlStateNormal];
        [ad.playMusic pause];
    }
    else{
        [self.backgroundMusicButton setTitle:@"game sound: on" forState:UIControlStateNormal];
        [ad.playMusic play];
    }
}


@end
