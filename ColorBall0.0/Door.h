//
//  Door.h
//  ColorBall0.0
//
//  Created by jie on 17/2/25.
//  Copyright © 2017年 jie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Item.h"

@interface Door : Item

@property (nonatomic, assign) NSUInteger color;
@property (nonatomic, assign) double xPosition;//门在x方向的位置，取值为0~1
@property (nonatomic, assign) double originSpeed;//门的原始速度
@property (nonatomic, assign) double lastProcessTime;//门的处理时间
@property (nonatomic, assign) double speed;//门的速度

- (instancetype) initWithColor: (int)color speed : (double) speed xPosition : (double) xPosition createTime : (double) createTime;

@end
