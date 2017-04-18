//
//  DoorCreater.m
//  ColorBall0.0
//
//  Created by jie on 17/3/17.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "DoorCreater.h"
#import "Door.h"

@interface DoorCreater ()

@property (nonatomic, assign) int color;
@property (nonatomic, assign) double pos;
@property (nonatomic, assign) double speed;

@end

@implementation DoorCreater

- (instancetype) initWithDictionary : (NSDictionary *) dictionary {
    self = [super init];
    
    NSNumber* num = dictionary[@"color"];
    if (num == nil) {
        self.color = rand() % 3;
    } else {
        self.color = [num integerValue] % 3;
    }
    
    num = dictionary[@"pos"];
    if (num == nil) {
        self.pos = 1.0;
    } else {
        self.pos = [num doubleValue];
    }
    
    num = dictionary[@"speed"];
    if (num == nil) {
        self.speed = 0.15;
    } else {
        self.speed = [num doubleValue];
    }
    
    return self;
}

- (void) process: (double) time manger: (Manager*) manager cmd: (NSString*) cmd {
    if ([cmd isEqualToString:@"create"]) {
        Door* door = [[Door alloc] initWithColor:_color speed:_speed xPosition:_pos createTime:time];
        [manager addItem:door];
    } else {
        NSLog(@"unknow cmd %@", cmd);
    }
}

@end
