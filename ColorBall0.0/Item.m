
//
//  Item.m
//  ColorBall0.0
//
//  Created by jie on 17/3/11.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "Item.h"

@interface Item ()

@end

@implementation Item


- (ProcessStatus) process : (double) time manger : (Manager *) manager{
    return ProcessStatusContinue;
}
- (void) drawContext : (CGContextRef)context rect : (CGRect) rect frame : (CGRect) frame{
}


@end
