//
//  SpeedChanger.m
//  ColorBall0.0
//
//  Created by jie on 17/3/17.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "SpeedChanger.h"
#import "Door.h"

@interface SpeedChanger ()

@property (nonatomic, strong) NSNumber* target;
@property (nonatomic, strong) NSNumber* diff;

@end

@implementation SpeedChanger

- (instancetype) initWithDictionary : (NSDictionary *) dictionary {
    self = [super init];
    
    self.target = dictionary[@"target"];
    if (_target == nil)
        self.diff = dictionary[@"diff"];
    
    return self;
}

- (void) process: (double) time manger: (Manager*) manager cmd: (NSString*) cmd {
    if ([cmd isEqualToString:@"change"]) {
        [self change: manager time:time];
    } else if ([cmd isEqualToString:@"rollback"]) {
        [self rollback: manager time:time];
    } else {
        NSLog(@"unknow cmd %@", cmd);
    }
}

- (void) change: (Manager*) manager time: (double)time {
    NSArray* arr = [manager getItemsByType:@"door"];
    for (int i = 0; i < [arr count]; ++i) {
        Door* door = arr[i];
        if (door.speed != door.originSpeed) {
            continue;
        }
        if (_target != nil) {
            door.speed = [_target doubleValue];
        } else if (_diff != nil) {
            door.speed = door.originSpeed + [_diff doubleValue];
        } else {
            NSLog(@"change speed error");
        }
    }
}

- (void) rollback: (Manager*) manager time: (double)time {
    NSArray* arr = [manager getItemsByType:@"door"];
    for (int i = 0; i < [arr count]; ++i) {
        Door* door = arr[i];
        door.speed = door.originSpeed;
    }
}

@end
