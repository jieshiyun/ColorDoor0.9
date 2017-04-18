//
//  Manager.m
//  ColorBall0.0
//
//  Created by jie on 17/2/24.
//  Copyright © 2017年 jie. All rights reserved.
//

#import "Manager.h"
#import "Door.h"
#import "Ball.h"
#import "TimeController.h"
#import "EndlessMap.h"
#import "RoundMap.h"

@interface Manager()

@property (nonatomic, strong) TimeController *timeController;
@property (nonatomic, strong) NSMutableDictionary *tempDictionary;

@property (nonatomic, assign) Boolean isFinished;

@end

static Manager *manager;
static NSString *roundName;

@implementation Manager

+ (Manager *)getManager{
    if (manager == nil) {
        Item* item = nil;
        if (roundName == nil) {
            item = [[EndlessMap alloc]init];
        } else if ([roundName isEqualToString:@"round1"]) {
//            item = [[RoundMap alloc] initWithJson:@"[{\"startTime\": 1, \"repeated\": 3, \"startInterval\": 2, \"endInterval\": 1, \"startSpeed\": 0.15, \"endSpeed\":0.2, \"itemType\": \"door\"},{\"startTime\": 15, \"repeated\": 1, \"startInterval\": 5, \"endInterval\": 5, \"startSpeed\": 0.5, \"endSpeed\":0.5, \"itemType\": \"door\"}]"];
            NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"round1.json" ofType:nil];
            item = [[RoundMap alloc] initWithJsonPath:jsonPath];
        }
        manager = [[Manager alloc] initWithItem:item];
    }
    return manager;
}

+ (void) reset{
    manager = nil;
}

+ (void) setRound: (NSString *) round {
    roundName = round;
}

- (instancetype) initWithItem: (Item *)mapItem{
    self = [super init];
    self.ball = [[Ball alloc] init];
    
    self.isInvincible = NO;
    
    //地图
    NSMutableArray *mapArr =[ @[mapItem] mutableCopy];
    
    self.isFinished = NO;
    self.itemDictionary =  [@{mapItem.type : mapArr} mutableCopy];
    
    self.timeController = [[TimeController alloc] init];
    srand((unsigned int)time(nil));
    return self;
}

- (RoundStatus)process{
    if (_isFinished)
        return RoundStatusContinue;
    double timeInterval = [self.timeController lap];
    
    
    //遍历_itemDictionary
    NSArray *typeArr = [_itemDictionary allKeys];
    for (int i = 0; i < [typeArr count]; i ++) {
        NSMutableArray *itemArr = _itemDictionary[typeArr[i]];
        NSMutableArray *deleteArr = [[NSMutableArray alloc] init];
        for (int j = 0; j < [itemArr count]; j++) {
            Item *item = itemArr[j];
            ProcessStatus rs = [item process:timeInterval manger:self];
            switch (rs) {
                case ProcessStatusContinue:
                    break;
                case ProcessStatusFailed:
                    if (self.isInvincible) {
                        return RoundStatusContinue;
                    }
                    self.isFinished = YES;
                    return RoundStatusFailed;
                    break;
                case ProcessStatusDelete:
                    [deleteArr addObject:item];
                    break;
                default:
                    break;
            }
        }
        for (int j = 0; j < [deleteArr count]; j++) {
            [itemArr removeObject:deleteArr[j]];
        }
        self.itemDictionary[typeArr[i]] = itemArr;
    }
    
    [self flushItem];
    
    typeArr = [_itemDictionary allKeys];
    for (int i = 0; i < [typeArr count]; i ++) {
        NSMutableArray *itemArr = _itemDictionary[typeArr[i]];
        if ([itemArr count] > 0)
            return RoundStatusContinue;
    }

    self.isFinished = YES;
    return RoundStatusSuccess;
}

- (void) flushItem {
    NSArray *typeArr = [_tempDictionary allKeys];
    for (int i = 0; i < [typeArr count]; i++) {
        NSString *type = typeArr[i];
        NSMutableArray *itemArr = _tempDictionary[type];
        for (int j = 0; j < [itemArr count]; ++j) {
            Item *item = itemArr[j];
            if (_itemDictionary[type] == nil)
                self.itemDictionary[type] = [[NSMutableArray alloc] init];
            [self.itemDictionary[type] addObject:item];
        }
    }
    self.tempDictionary = [[NSMutableDictionary alloc] init];
}

- (void) addItem: (Item *) item {
    if (item == nil) {
        return;
    }
    NSMutableArray *arr = _tempDictionary[item.type];
    if (!arr) {
        arr = [[NSMutableArray alloc] init];
    }
    [arr addObject:item];
    self.tempDictionary[item.type] = arr;
}

- (NSArray *) getItemsByType : (NSString *) type{
    NSMutableArray *arr = self.itemDictionary[type];
    if (!arr)
        return [[NSArray alloc] init];
    return arr;
}

- (void) pause {
    [self.timeController pause];
}

- (void) resume{
    [self.timeController resume];
}

@end
