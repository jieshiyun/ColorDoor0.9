//
//  Manager.h
//  ColorBall0.0
//
//  Created by jie on 17/2/24.
//  Copyright © 2017年 jie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

@class Item;
@class Ball;

@interface Manager : NSObject

@property (nonatomic, strong) Ball *ball;
@property (nonatomic, strong) NSMutableDictionary *itemDictionary;

@property (nonatomic, assign) Boolean isInvincible;

+ (Manager *)getManager;
+ (void) setRound: (NSString *) round;
+ (void) reset;

- (RoundStatus) process;
- (void) addItem: (Item *) item;
- (NSArray *) getItemsByType : (NSString *) type;

- (void) pause;
- (void) resume;

@end
