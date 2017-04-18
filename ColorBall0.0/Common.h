//
//  Common.h
//  ColorBall0.0
//
//  Created by jie on 17/3/12.
//  Copyright © 2017年 jie. All rights reserved.
//

#import <Foundation/Foundation.h>

//Item的状态
typedef NS_ENUM(NSInteger, ProcessStatus) {
    //item 还没被碰撞，继续游戏
    ProcessStatusContinue = 1,
    //item被碰撞，游戏失败
    ProcessStatusFailed,
    //此item成功通过，删除item，游戏继续
    ProcessStatusDelete,
    //通关，游戏结束
    ProcessStatusSuccess
};

//关卡状态，manager用
typedef NS_ENUM(NSInteger, RoundStatus) {
    //通关失败，游戏结束
    RoundStatusFailed = 1,
    //通关成功，游戏结束
    RoundStatusSuccess,
    //关卡继续
    RoundStatusContinue,

};
