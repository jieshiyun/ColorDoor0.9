//
//  ScriptFunction.m
//  ColorBall0.0
//
//  Created by jie on 17/3/17.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "ScriptFunction.h"

#import "DoorCreater.h"
#import "InvincibleChanger.h"
#import "SpeedChanger.h"

@implementation ScriptFunction

- (instancetype) initWithDictionary : (NSDictionary *) dictionary {
    self = [super init];
    return self;
}

- (void) process: (double) time manger: (Manager*) manager cmd: (NSString*) cmd {
    
}

+ (ScriptFunction*) createScriptFunctionByName: (NSString*) name dictionary: (NSDictionary*) dictionary {
    if ([name isEqualToString:@"DoorCreater"]) {
        return [[DoorCreater alloc]initWithDictionary:dictionary];
    } else if ([name isEqualToString:@"InvincibleChanger"]) {
        return [[InvincibleChanger alloc] initWithDictionary:dictionary];
    } else if ([name isEqualToString:@"SpeedChanger"]) {
        return [[SpeedChanger alloc] initWithDictionary:dictionary];
    } else {
        NSLog(@"unknow function name %@", name);
    }
    return nil;
}

@end
