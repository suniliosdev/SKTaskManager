//
//  SKTask.h
//  StorageDemo
//
//  Created by Sunil on 5/18/15.
//  Copyright (c) 2015 SpaceO. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BlockTaskCompletion)(id result);
typedef void(^BlockTask)(id result, BlockTaskCompletion completion);

@interface SKTask : NSObject{


}
@property(copy) BlockTask blockTask;
+(SKTask*)taskWithBlock:(BlockTask)blockTask;
@end
