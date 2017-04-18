//
//  GameViewController.m
//  ColorBall0.0
//
//  Created by jie on 17/2/24.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "GameViewController.h"
#import "GameView.h"
#import "Manager.h"
#import "Ball.h"
#import "PauseViewController.h"

@interface GameViewController ()

@property NSTimer *timer;
@property GameView *gameView;

@property (nonatomic, strong) UIButton *pauseBut;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view = [[GameView alloc] init];

    self.pauseBut = [[UIButton alloc] init];
    [self.pauseBut setTitle:@"| |" forState:UIControlStateNormal];
    [self.pauseBut setTitleColor:[UIColor colorWithRed:90/255.0 green:169/255.0 blue:197/255.0 alpha:1] forState:UIControlStateNormal];
    //    self.pauseBut.backgroundColor = [UIColor redColor];
    self.pauseBut.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.pauseBut];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[pauseBut(100)]-30-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:@{@"pauseBut": self.pauseBut}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[pauseBut(30)]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:@{@"pauseBut": self.pauseBut}]];
    
    
        
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 0.01
                                                  target: self
                                                selector: @selector(action)
                                                userInfo: nil
                                                 repeats: YES];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapGesture];
    
    [self.pauseBut addTarget:self action:@selector(setpauseBut:) forControlEvents:UIControlEventTouchUpInside];
    
//    [Manager setRound:@"round1"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)action{
    [self.view setNeedsDisplay];
}

- (void)tap:(id) sender{
    Manager *manager = [Manager getManager];
     if (manager.ball.color == 2)
        manager.ball.color = 0;
    else
        manager.ball.color++;
}

- (void)setpauseBut:(UIButton *)pauseBut {
    [[Manager getManager] pause];
    [self presentViewController:[[PauseViewController alloc] init] animated:YES completion:nil];
}

@end
