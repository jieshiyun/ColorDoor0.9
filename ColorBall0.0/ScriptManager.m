//
//  ScriptManager.m
//  ColorBall0.0
//
//  Created by jie on 17/3/16.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "ScriptManager.h"
#import "Manager.h"
#import "Door.h"
#import "ScriptItem.h"

@interface ScriptManager ()

@property (nonatomic, readwrite, assign) double startTime;
@property (nonatomic, readwrite, assign) NSInteger repeated;
@property (nonatomic, readwrite, assign) double startInterval;
@property (nonatomic, readwrite, assign) double endInterval;
@property (nonatomic, readwrite, assign) double startSpeed;
@property (nonatomic, readwrite, assign) double endSpeed;
@property (nonatomic, readwrite, copy) NSString *itemType;
@property (nonatomic, readwrite, copy) NSDictionary *otherData;

@property (nonatomic, assign) NSInteger currentCreatedNum;

- (Item *) createItem : (double) createTime;

@end

@implementation ScriptManager

- (instancetype) initWithDic : (NSDictionary *) dic {
    self = [super init];
    
    self.startTime = [dic[@"startTime"] floatValue];
    self.repeated = [dic[@"repeated"] integerValue];
    self.startInterval = [dic[@"startInterval"] floatValue];
    self.endInterval = [dic[@"endInterval"] floatValue];
    self.startSpeed = [dic[@"startSpeed"] floatValue];
    self.endSpeed = [dic[@"endSpeed"] floatValue];
    self.itemType = dic[@"itemType"];
    self.otherData = dic[@"otherData"];
    
    self.currentCreatedNum = 0;

    return self;
}

- (Boolean) process : (double) time manger : (Manager *) manager{
    while (_startTime < time && _currentCreatedNum < _repeated) {
        [manager addItem:[self createItem: _startTime]];
        double currentInterval = (_endInterval - _startInterval) / _repeated * _currentCreatedNum + _startInterval;
        self.startTime += currentInterval;
        ++self.currentCreatedNum;
    }
    return _currentCreatedNum >= _repeated;
}

- (Item *) createItem : (double) createTime{
    if ([_itemType isEqualToString:@"door"]) {
        double currentSpeed = (_endSpeed - _startSpeed) / _repeated * _currentCreatedNum + _startSpeed;
        Door* door = [[Door alloc]initWithColor:rand() % 3 speed:currentSpeed xPosition:1.0 createTime:createTime];
        NSLog(@"create time %lf %@", createTime, door);
        return door;
    } else if ([_itemType isEqualToString:@"script"]) {
        double currentSpeed = (_endSpeed - _startSpeed) / _repeated * _currentCreatedNum + _startSpeed;
        return [ScriptItem getItem:currentSpeed createTime: createTime type: _otherData[@"type"]];
    }
    return nil;
}






@end
