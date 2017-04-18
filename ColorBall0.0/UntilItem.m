//
//  UntilItem.m
//  ColorBall0.0
//
//  Created by jie on 17/3/18.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "UntilItem.h"

#import "ScriptFunction.h"

@implementation UntilItem {
    double _startTime;
    double _endTime;
    ScriptFunction* _func;
    NSString* _commend;
}

- (instancetype) initWithDictionary: (NSDictionary*) dictionary time:(double) time {
    self = [super init];
    self.type = @"_until";
    NSNumber* num = dictionary[@"startTime"];
    _startTime = time + [num doubleValue];
    num = dictionary[@"endTime"];
    _endTime = time + [num doubleValue];
    _commend = dictionary[@"cmd"];
    _func = [ScriptFunction createScriptFunctionByName:dictionary[@"name"] dictionary:dictionary[@"info"]];
    return self;
}

- (ProcessStatus) process : (double) time manger : (Manager *) manager {
    if (_startTime < time) {
        [_func process:_startTime manger:manager cmd:_commend];
    }
    return time < _endTime ? ProcessStatusContinue : ProcessStatusDelete;
}

@end
