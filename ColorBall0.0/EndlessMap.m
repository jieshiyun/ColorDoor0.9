//
//  EndlessMap.m
//  ColorBall0.0
//
//  Created by jie on 17/3/12.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "EndlessMap.h"
#import "Door.h"
#import "Manager.h"
#import "Common.h"

@interface EndlessMap ()

@property (nonatomic, assign) double lastCreateTime;
@property (nonatomic, assign) double lastCreateSpeed;

@end

@implementation EndlessMap

- (instancetype) init {
    self = [super init];
    self.type = @"map";
    self.lastCreateTime = 0;
    self.lastCreateSpeed = 0.15;
    
    return self;
}

- (ProcessStatus) process : (double) time manger : (Manager *) manager {
    while (_lastCreateTime + 2.0 < time) {
        double speed = _lastCreateSpeed + 0.01 > 1.0 ? 1.0 : _lastCreateSpeed + 0.01;
        Door *item = [[Door alloc] initWithColor:rand() % 3 speed: speed  xPosition:1.0 createTime:_lastCreateTime + 2.0];
        self.lastCreateTime += 2.0;
        self.lastCreateSpeed = speed;
        [manager addItem:item];
    }
    return ProcessStatusContinue;
}


@end
