//
//  ScriptFunction.h
//  ColorBall0.0
//
//  Created by jie on 17/3/17.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "Manager.h"

@interface ScriptFunction : NSObject

- (instancetype) initWithDictionary : (NSDictionary *) dictionary;
- (void) process: (double) time manger: (Manager*) manager cmd: (NSString*) cmd;

+ (ScriptFunction*) createScriptFunctionByName: (NSString*) name dictionary: (NSDictionary*) dictionary;

@end
