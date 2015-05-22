//
//  SKTask.m
//  StorageDemo
//
//  Created by Sunil on 5/18/15.
//  Copyright (c) 2015 SpaceO. All rights reserved.
//

#import "SKTaskManager.h"
@implementation SKTaskManager

+(void)sequenceOperations:(NSMutableArray*)arrOperation completion:(void(^)(void))completion{

    if (arrOperation.count) {
        SKTask *task=(SKTask*)[arrOperation firstObject];
        if ([task isKindOfClass:[SKTask class]]) {
            
            task.blockTask(nil,^(id BlockTaskCompletion){
                //this block get called when task completed
                [arrOperation removeObjectAtIndex:0];
                [SKTaskManager sequenceOperations:arrOperation completion:completion];
                
            });
        }
    }else{
        if (completion) {
            completion();
        }
    }
}
+(void)parallerOperations:(NSMutableArray*)arrOperation completion:(void(^)(void))completion{
    
    NSMutableArray *arrTaskRunning=[arrOperation mutableCopy];
    if (arrOperation.count) {
        for (int i=0; i<arrOperation.count; i++) {
            SKTask *task=(SKTask*)[arrOperation objectAtIndex:i];
            if ([task isKindOfClass:[SKTask class]]) {
                task.blockTask(nil,^(id BlockTaskCompletion){
                    if ([arrTaskRunning containsObject:task]) {
                        [arrTaskRunning removeObject:task];
                    }
                    
                    if (arrTaskRunning.count==0) {
                        if (completion) {
                            completion();
                        }
                    }

                });
            }
        }
    }else{
        if (completion) {
            completion();
        }
    }
}

@end
