//
//  PauseViewController.m
//  ColorBall0.0
//
//  Created by jie on 17/3/16.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "PauseViewController.h"
#import "Manager.h"

@interface PauseViewController ()

@property (weak, nonatomic) IBOutlet UIButton *resumeBut;

@end

@implementation PauseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.resumeBut addTarget:self action:@selector(setresumeBut:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setresumeBut:(UIButton *)resumeBut {
    [[Manager getManager] resume];
    [self dismissViewControllerAnimated:YES completion:nil];
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
