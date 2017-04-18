//
//  TimeController.h
//  ColorBall0.0
//
//  Created by jie on 17/3/12.
//  Copyright © 2017年 jie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeController : NSObject

- (instancetype) init;
- (NSTimeInterval) lap;

- (void) pause;
- (void) resume;

@end
