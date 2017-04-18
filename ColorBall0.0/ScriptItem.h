//
//  ScriptItem.h
//  ColorBall0.0
//
//  Created by jie on 17/3/12.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "Item.h"

@interface ScriptItem : Item

- (instancetype) initWithDictionary: (NSDictionary*) dictionary speed : (double) speed createTime: (double) createTime type: (NSString*) type;

+ (ScriptItem*) getItem: (double) speed createTime: (double) createTime type: (NSString*) type;

@end
