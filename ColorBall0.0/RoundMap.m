//
//  RoundMap.m
//  ColorBall0.0
//
//  Created by jie on 17/3/15.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "RoundMap.h"
#import "ScriptManager.h"

@interface RoundMap ()

@property (nonatomic, strong) NSMutableArray *scriptManagerArr;

@end

@implementation RoundMap

- (instancetype) initWithJsonPath : (NSString *) jsonPath {
    self = [super init];
    
//    NSLog(@"%@", jsonPath);
    
//    NSData *jsonData = [jsonPath dataUsingEncoding:NSUTF8StringEncoding];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
    
    self.scriptManagerArr = [[NSMutableArray alloc] init];
    self.type = @"map";
    
    for (int i = 0; i < [arr count]; i ++) {
        [self.scriptManagerArr addObject: [[ScriptManager alloc] initWithDic:arr[i]]];
    }
    
    return self;
}

- (ProcessStatus) process : (double) time manger : (Manager *) manager{
    Boolean isALlFinish = YES;
    for (int i = 0; i < [self.scriptManagerArr count]; i ++) {
        ScriptManager *sm = self.scriptManagerArr[i];
        if (![sm process:time manger:manager]) {
            isALlFinish = NO;
        };
    }
    if (isALlFinish)
        return ProcessStatusDelete;
    return ProcessStatusContinue;
    
}


@end
