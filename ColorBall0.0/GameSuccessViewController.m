//
//  GameSuccessViewController.m
//  ColorBall0.0
//
//  Created by jie on 17/3/19.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "GameSuccessViewController.h"
#import "Manager.h"
#import "GameViewController.h"
#import "ViewController.h"

@interface GameSuccessViewController ()
@property (weak, nonatomic) IBOutlet UIButton *restartButton;
@property (weak, nonatomic) IBOutlet UIButton *backToBeginButton;

@end

@implementation GameSuccessViewController

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