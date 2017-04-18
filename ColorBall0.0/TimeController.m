//
//  TimeController.m
//  ColorBall0.0
//
//  Created by jie on 17/3/12.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "TimeController.h"

@interface TimeController ()

@property (nonatomic, assign) double beginTime;
@property (nonatomic, assign) double tempTime;

@end

@implementation TimeController

- (instancetype) init{
    self = [super init];
    self.beginTime = [[NSDate date] timeIntervalSince1970];
    self.tempTime = 0;
    return self;
}

- (NSTimeInterval) lap {
    return [[NSDate date] timeIntervalSince1970] - _beginTime;
}

- (void) pause {
    self.tempTime = [[NSDate date] timeIntervalSince1970];
}

- (void) resume {
    double t = [[NSDate date] timeIntervalSince1970] - self.tempTime;
    self.beginTime += t;
}

@end
