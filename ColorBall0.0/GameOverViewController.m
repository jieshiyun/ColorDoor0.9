//
//  GameOverViewController.m
//  ColorBall0.0
//
//  Created by jie on 17/2/25.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "GameOverViewController.h"
#import "GameViewController.h"
#import "ViewController.h"
#import "Manager.h"

@interface GameOverViewController ()
@property (weak, nonatomic) IBOutlet UIButton *restartButton;
@property (weak, nonatomic) IBOutlet UIButton *backToBeginButton;

@end

@implementation GameOverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.restartButton addTarget:self action:@selector(restart:) forControlEvents:UIControlEventTouchUpInside];
    [self.backToBeginButton addTarget:self action:@selector(backToBegin:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) restart: (id)sender{
    [Manager reset];
    [self presentViewController:[[GameViewController alloc] init] animated:YES completion:nil];
}

- (void) backToBegin: (id)sender{
    [self presentViewController:[[ViewController alloc] init] animated:YES completion:nil];
}

@end
