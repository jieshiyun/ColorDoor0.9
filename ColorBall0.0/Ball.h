//
//  Ball.h
//  ColorBall0.0
//
//  Created by jie on 17/3/12.
//  Copyright © 2017年 jie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ball : NSObject

//球的颜色
@property (nonatomic, assign) NSUInteger color;
//球的x位置
@property (nonatomic, readonly, assign) double xPosition;

- (instancetype) init;

- (void) drawContext : (CGContextRef)context rect : (CGRect) rect frame : (CGRect) frame;

@end

