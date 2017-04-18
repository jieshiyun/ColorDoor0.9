//
//  Ball.m
//  ColorBall0.0
//
//  Created by jie on 17/3/12.
//  Copyright © 2017年 jie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ball.h"

@interface Ball ()

@property (nonatomic, readwrite, assign) double xPosition;

@end

@implementation Ball

- (instancetype) init{
    self = [super init];
    self.xPosition = 0.2;
    self.color = 0;
    return self;
}

- (void) drawContext : (CGContextRef)context rect : (CGRect) rect frame : (CGRect) frame{
    CGRect ballFrame = CGRectMake(50, 200, 40, 40);
    //填充当前绘画区域内的颜色
    [[UIColor colorWithRed:242/255.0 green:242/255.0  blue:242/255.0 alpha:1] set];
    //填充当前矩形区域
    CGContextFillRect(context, rect);
    //以矩形frame为依据画一个圆
    CGContextAddEllipseInRect(context, ballFrame);
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
        case 3:
            [[UIColor colorWithRed:106/255.0 green:150/255.0 blue:133/255.0 alpha:1] set];
            break;
        case 4:
            [[UIColor colorWithRed:199/255.0 green:175/255.0 blue:151/255.0 alpha:1] set];
            break;
        default:
            break;
    }
    //填充(沿着矩形内围填充出指定大小的圆)
    CGContextFillPath(context);
}

@end
