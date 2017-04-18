//
//  InvincibleChanger.m
//  ColorBall0.0
//
//  Created by jie on 17/3/17.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "InvincibleChanger.h"

@implementation InvincibleChanger

- (void) process: (double) time manger: (Manager*) manager cmd: (NSString*) cmd {
    if ([cmd isEqualToString:@"change"]) {
        [self change: manager];
    } else if ([cmd isEqualToString:@"rollback"]) {
        [self rollback: manager];
    } else {
        NSLog(@"unknow cmd %@", cmd);
    }
}

- (void) change: (Manager*) manager {
    [manager setIsInvincible: YES];
}

- (void) rollback: (Manager*) manager {
    [manager setIsInvincible: NO];
}

@end
