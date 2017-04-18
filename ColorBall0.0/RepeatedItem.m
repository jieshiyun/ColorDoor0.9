//
//  RepeatedItem.m
//  ColorBall0.0
//
//  Created by jie on 17/3/18.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "RepeatedItem.h"
#import "ScriptFunction.h"

@implementation RepeatedItem {
    double _startTime;
    NSUInteger _repeated;
    NSUInteger _currentNum;
    double _interval;
    ScriptFunction* _func;
    NSString* _commend;
}

- (instancetype) initWithDictionary: (NSDictionary*) dictionary time:(double) time {
    self = [super init];
    self.type = @"_repeated";
    NSNumber* num = dictionary[@"startTime"];
    _startTime = time + [num doubleValue];
    num = dictionary[@"repeated"];
    _repeated = [num unsignedIntegerValue];
    _currentNum = 0;
    num = dictionary[@"interval"];
    _interval = [num doubleValue];
    _commend = dictionary[@"cmd"];
    _func = [ScriptFunction createScriptFunctionByName:dictionary[@"name"] dictionary:dictionary[@"info"]];
    return self;
}

- (ProcessStatus) process : (double) time manger : (Manager *) manager {
    while (_startTime < time && _currentNum < _repeated) {
        [_func process:_startTime manger:manager cmd:_commend];
        _startTime += _interval;
        ++_currentNum;
    }
    return _currentNum < _repeated ? ProcessStatusContinue : ProcessStatusDelete;
}

@end
