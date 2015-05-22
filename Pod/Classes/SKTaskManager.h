//
//  SKTask.h
//  StorageDemo
//
//  Created by Sunil on 5/18/15.
//  Copyright (c) 2015 SpaceO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKTask.h"

@interface SKTaskManager : NSObject

+(void)sequenceOperations:(NSMutableArray*)arrOperation completion:(void(^)(void))completion;
+(void)parallerOperations:(NSMutableArray*)arrOperation completion:(void(^)(void))completion;
@end
