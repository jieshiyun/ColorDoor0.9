//
//  GameView.m
//  ColorBall0.0
//
//  Created by jie on 17/2/24.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "GameView.h"
#import "Manager.h"
#import "Door.h"
#import "GameOverViewController.h"
#import "ViewController.h"
#import "Ball.h"
#import "GameSuccessViewController.h"

@interface GameView ()

@end

@implementation GameView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0  blue:242/255.0 alpha:1];

    
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
//    [[self getViewController] presentViewController:[[ViewController alloc] init] animated:YES completion:nil];
    
    Manager *manager = [Manager getManager];
    RoundStatus rs = [manager process];
    if(rs == RoundStatusFailed)
    {
        NSLog(@"%ld", rs);
        [[self getViewController] presentViewController:[[GameOverViewController alloc] init] animated:YES completion:nil];
        return;
    }
    
    if(rs == RoundStatusSuccess)
    {
        NSLog(@"%ld", rs);
        [[self getViewController] presentViewController:[[GameSuccessViewController alloc] init] animated:YES completion:nil];
        return;
    }
    
    // 获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //画球
    [manager.ball drawContext:context rect:rect frame:self.frame];
    
    //遍历manager的itemDictionary，逐一画出
    NSArray *typeArr = [manager.itemDictionary allKeys];
    for (int i = 0; i < [typeArr count]; i ++) {
        NSArray *itemArr = manager.itemDictionary[typeArr[i]];
        for (int j = 0; j < [itemArr count]; j++) {
            Item *item = itemArr[j];
            [item drawContext:context rect:rect frame:self.frame];
        }
    }
}

//- (void) drawBall: (CGContextRef)context rect: (CGRect)rect{
//    CGRect ballFrame = CGRectMake(50, 200, 40, 40);
//    self.info.ballXPosition = 1.0 - 70/self.frame.size.width;
//    //填充当前绘画区域内的颜色
//    [[UIColor colorWithRed:242/255.0 green:242/255.0  blue:242/255.0 alpha:1] set];
//    //填充当前矩形区域
//    CGContextFillRect(context, rect);
//    //以矩形frame为依据画一个圆
//    CGContextAddEllipseInRect(context, ballFrame);
//    //填充当前绘画区域内的颜色
//    switch (self.info.ballColor) {
//        case 0:
//            [[UIColor colorWithRed:248/255.0 green:223/255.0 blue:218/255.0 alpha:1] set];
//            break;
//        case 1:
//            [[UIColor colorWithRed:195/255.0 green:227/255.0 blue:216/255.0 alpha:1] set];
//            break;
//        case 2:
//            [[UIColor colorWithRed:221/255.0 green:220/255.0 blue:216/255.0 alpha:1] set];
//            break;
//        case 3:
//            [[UIColor colorWithRed:106/255.0 green:150/255.0 blue:133/255.0 alpha:1] set];
//            break;
//        case 4:
//            [[UIColor colorWithRed:199/255.0 green:175/255.0 blue:151/255.0 alpha:1] set];
//            break;
//        default:
//            break;
//    }
//    //填充(沿着矩形内围填充出指定大小的圆)
//    CGContextFillPath(context);
//}

//- (void) drawDoor: (CGContextRef)context rect: (CGRect)rect{
//    for (Door *door in self.info.doorArray) {
//        CGRect doorFrame = CGRectMake(self.frame.size.width * (1-door.xPosition), 150, 20, 80);
//        CGContextAddRect(context, doorFrame);
//        //填充当前绘画区域内的颜色
//        switch (door.doorColor) {
//            case 0:
//                [[UIColor colorWithRed:248/255.0 green:223/255.0 blue:218/255.0 alpha:1] set];
//                break;
//            case 1:
//                [[UIColor colorWithRed:195/255.0 green:227/255.0 blue:216/255.0 alpha:1] set];
//                break;
//            case 2:
//                [[UIColor colorWithRed:221/255.0 green:220/255.0 blue:216/255.0 alpha:1] set];
//                break;
//            case 3:
//                [[UIColor colorWithRed:106/255.0 green:150/255.0 blue:133/255.0 alpha:1] set];
//                break;
//            case 4:
//                [[UIColor colorWithRed:199/255.0 green:175/255.0 blue:151/255.0 alpha:1] set];
//                break;
//            default:
//                break;
//        }
//        //填充(沿着矩形内围填充出指定大小的圆)
//        CGContextFillPath(context);
//    }
//}

//获取当前view所在的控制器
- (UIViewController *)getViewController
{
    //获取当前view的superView对应的控制器
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}


@end
