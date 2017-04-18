//
//  ScriptManager.h
//  ColorBall0.0
//
//  Created by jie on 17/3/16.
//  Copyright © 2017年 jie. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;
@class Manager;

@interface ScriptManager : NSObject

@property (nonatomic, readonly, assign) double startTime;
@property (nonatomic, readonly, assign) NSInteger repeated;
@property (nonatomic, readonly, assign) double startInterval;
@property (nonatomic, readonly, assign) double endInterval;
@property (nonatomic, readonly, assign) double startSpeed;
@property (nonatomic, readonly, assign) double endSpeed;
@property (nonatomic, readonly, copy) NSString *itemType;
@property (nonatomic, readonly, copy) NSDictionary *otherData;

- (instancetype) initWithDic : (NSDictionary *) dic;

- (Boolean) process : (double) time manger : (Manager *) manager;

@end
