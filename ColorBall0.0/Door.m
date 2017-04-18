//
//  Door.m
//  ColorBall0.0
//
//  Created by jie on 17/2/25.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "Door.h"
#import "Manager.h"
#import "Ball.h"

@interface Door ()

@property (nonatomic, assign) Boolean isDetectedCollision;

@end

@implementation Door

- (instancetype) initWithColor: (int)color speed : (double) speed xPosition : (double) xPosition createTime : (double) createTime {
    self = [super init];
    self.type = @"door";
    self.isDetectedCollision = NO;

    self.color = color;
    self.speed = speed;
    self.originSpeed = speed;
    self.xPosition = xPosition;
    self.lastProcessTime = createTime;
    
    return self;
}

- (void) drawContext : (CGContextRef)context rect : (CGRect) rect frame : (CGRect) frame{
    CGRect doorFrame = CGRectMake(frame.size.width * self.xPosition, 160, 20, 80);
    CGContextAddRect(context, doorFrame);
    //填充当前绘画区域内的颜色
    switch (self.color) {
        case 0:
            [[UIColor colorWithRed:248/255.0 green:223/255.0 blue:218/255.0 alpha:1] set];
            break;
        case 1:
            [[UIColor colorWithRed:195/255.0 green:227/255.0 blue:216/255.0 alpha:1] set];
            break;
        case 2:
            [[UIColor colorWithRed:221/255.0 green:220/255.0 blue:216/255.0 alpha:1] set];
            break;
//        case 3:
//            [[UIColor colorWithRed:106/255.0 green:150/255.0 blue:133/255.0 alpha:1] set];
//            break;
//        case 4:
//            [[UIColor colorWithRed:199/255.0 green:175/255.0 blue:151/255.0 alpha:1] set];
//            break;
        default:
            break;
    }
    //填充(沿着矩形内围填充出指定大小的圆)
    CGContextFillPath(context);
}

- (ProcessStatus) process : (double) time manger : (Manager *) manager{
    double existTime = time - self.lastProcessTime;
    
    self.xPosition -= self.speed * existTime;
    self.lastProcessTime = time;
    
    Ball * ball = manager.ball;

    //检测碰撞
    if (!_isDetectedCollision) {
        if (_xPosition + 0.1 < ball.xPosition){
            self.isDetectedCollision = YES;
            if (_color != ball.color){
                NSLog(@"exit,,,,door:::%f,ball:::: %f",_xPosition,ball.xPosition);
                return ProcessStatusFailed;
            }
        }
    }
    
    if (self.xPosition < 0.0) {
        return ProcessStatusDelete;
    }
    return ProcessStatusContinue;
}




@end
