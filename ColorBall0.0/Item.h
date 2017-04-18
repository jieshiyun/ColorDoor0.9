//
//  Item.h
//  ColorBall0.0
//
//  Created by jie on 17/3/11.
//  Copyright © 2017年 jie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Common.h"

@class Manager;

@interface Item : NSObject

@property (nonatomic, copy) NSString *type;

- (ProcessStatus) process : (double) time manger : (Manager *) manager;
- (void) drawContext : (CGContextRef)context rect : (CGRect) rect frame : (CGRect) frame;

@end
