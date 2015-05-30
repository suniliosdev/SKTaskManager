//
//  SKTask.m
//  StorageDemo
//
//  Created by Sunil on 5/18/15.
//  Copyright (c) 2015 SpaceO. All rights reserved.
//

#import "SKTask.h"

@implementation SKTask

//---create task with its execution block and set completion block
+(SKTask*)taskWithBlock:(BlockTask)blockTask{

    SKTask *task=[[SKTask alloc] init];
    task.blockTask=blockTask;
    return task;
}
@end
