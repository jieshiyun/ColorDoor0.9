//
//  ViewController.m
//  ColorBall0.0
//
//  Created by jie on 17/2/24.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "ViewController.h"
#import "SettingViewController.h"
#import "GameViewController.h"
#import "Manager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *settingButton;

@property (weak, nonatomic) IBOutlet UIButton *RoundMode;
@property (weak, nonatomic) IBOutlet UIButton *EndlessMode;
@end

@implementation ViewController

#pragma mark 绘制圆


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.settingButton addTarget:self action:@selector(set:) forControlEvents:UIControlEventTouchUpInside];
    [self.RoundMode addTarget:self action:@selector(setRoundModeh:) forControlEvents:UIControlEventTouchUpInside];
    [self.EndlessMode addTarget:self action:@selector(setEndlessModeh:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setRoundModeh:(UIButton *)RoundMode {
    [Manager reset];
    [Manager setRound: @"round1"];
    [self presentViewController: [[GameViewController alloc] init] animated:YES completion:nil];
}

- (void) setEndlessModeh:(UIButton *)EndlessMode {
    [Manager reset];
    [Manager setRound: nil];
    [self presentViewController: [[GameViewController alloc] init] animated:YES completion:nil];
}

- (void)set:(id) sender{
    [self presentViewController:[[SettingViewController alloc] init] animated:YES completion:nil];
}

@end
