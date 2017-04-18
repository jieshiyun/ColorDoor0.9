//
//  ScriptItem.m
//  ColorBall0.0
//
//  Created by jie on 17/3/12.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "ScriptItem.h"
#import "Manager.h"
#import "Ball.h"
#import "RepeatedItem.h"
#import "UntilItem.h"
#import "Item.h"

@implementation ScriptItem {
    double _xPosition;
    double _speed;
    double _createTime;
    NSArray* _onCreateOP;
    NSArray* _onDestroyOP;
    NSArray* _onCollisionOP;
    Boolean _hasCreated;
    Boolean _hasCollision;
    Boolean _hasDelete;
    double _r;
    double _g;
    double _b;
}

- (instancetype) initWithDictionary: (NSDictionary*) dictionary speed : (double) speed createTime: (double) createTime type: (NSString*) type{
    self = [super init];
    self.type = type;
    _xPosition = 1.0;
    _speed = speed;
    _createTime = createTime;
    _onCreateOP = dictionary[@"onCreate"];
    _onDestroyOP = dictionary[@"onDestroy"];
    _onCollisionOP = dictionary[@"onCollision"];
    _hasCreated = NO;
    _hasCollision = NO;
    _hasDelete = NO;
    NSNumber* num = dictionary[@"color_r"];
    _r = [num doubleValue];
    num = dictionary[@"color_g"];
    _g = [num doubleValue];
    num = dictionary[@"color_b"];
    _b = [num doubleValue];
    return self;
}

- (ProcessStatus) process : (double) time manger : (Manager *) manager{
    if (_hasCreated == NO) {
        [self doEvent:_onCreateOP time:time manager:manager];
        _hasCreated = YES;
    }
    double existTime = time - _createTime;
    
    _xPosition = 1 - _speed * existTime;
    
    Ball * ball = manager.ball;
    
    if (!_hasCollision) {
        if (_xPosition + 0.1 < ball.xPosition) {
            [self doEvent:_onCollisionOP time:time manager:manager];
            _hasCollision = YES;
        }
    }
    
    if (_xPosition < 0.0) {
        if (!_hasDelete) {
            [self doEvent:_onDestroyOP time:time manager:manager];
            _hasDelete = YES;
        }
        return ProcessStatusDelete;
    }
    return ProcessStatusContinue;
}

- (void) drawContext : (CGContextRef)context rect : (CGRect) rect frame : (CGRect) frame {
    CGRect ballFrame = CGRectMake(_xPosition * frame.size.width, 210, 20, 20);

    //以矩形frame为依据画一个圆
    CGContextAddEllipseInRect(context, ballFrame);
    //填充当前绘画区域内的颜色
    [[UIColor colorWithRed:_r green:_g blue:_b alpha:1.0] set];
    //填充(沿着矩形内围填充出指定大小的圆)
    CGContextFillPath(context);

}

- (void) doEvent: (NSArray*) arr time: (double) time manager: (Manager*) manager {
    if (arr == nil) {
        return;
    }
    for (int i = 0; i < [arr count]; ++i) {
        NSDictionary* dictionary = arr[i];
        NSString* type = dictionary[@"type"];
        NSDictionary* data = dictionary[@"data"];
        Item* item;
        if ([type isEqualToString:@"repeated"]) {
            item = [[RepeatedItem alloc]initWithDictionary:data time:time];
        } else if ([type isEqualToString:@"until"]) {
            item = [[UntilItem alloc] initWithDictionary:data time:time];
        }
        [manager addItem:item];
    }
}

static NSDictionary* typeDict = nil;

+ (ScriptItem*) getItem: (double) speed createTime: (double) createTime type: (NSString*) type {
    if (typeDict == nil) {
        NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"item.json" ofType:nil];
        NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
        typeDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
    }

    NSDictionary* data = typeDict[type];
    return [[ScriptItem alloc] initWithDictionary:data speed:speed createTime:createTime type:type];
}

@end
