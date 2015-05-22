//
//  SKTaskManagerTests.m
//  SKTaskManagerTests
//
//  Created by SunilSpaceo on 05/22/2015.
//  Copyright (c) 2014 SunilSpaceo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SKTaskManager/SKTaskManager.h>
@interface Tests : XCTestCase{

}
@property(nonatomic,strong) NSMutableArray *arrTasks;
@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    NSMutableArray *arrURLs=[NSMutableArray new];
    [arrURLs addObject:@"http://cdn.koimoi.com/wp-content/new-galleries/2012/02/Priyanka-Chopra-Wallpaper-4.jpg"];
    [arrURLs addObject:@"http://bollywoodnews.rosegalaxy.com/wp-content/uploads/2013/05/Priyanka-Chopra-photoshoot-2013-15.jpg"];
    [arrURLs addObject:@"http://i.huffpost.com/gen/1452721/thumbs/o-PRIYANKA-CHOPRA-900.jpg"];
    [arrURLs addObject:@"http://freepressjournal.in/wp-content/uploads/2014/03/priyanka.jpg"];
    [arrURLs addObject:@"http://wallpapers.filmibeat.com/ph-1024x768/2014/09/priyanka-chopra_141145173400.jpg"];
    
    _arrTasks=[NSMutableArray new];
    for (int i=0; i<arrURLs.count; i++) {
        //create tasks and add all task to array
        SKTask *task=[SKTask taskWithBlock:^(id result, BlockTaskCompletion completion) {
            NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:arrURLs[i]]];
            NSLog(@"task start:-  %@",request.URL.absoluteString);
            [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                
                NSLog(@"task completed:-  %@",request.URL.absoluteString);
                
                //call completion block to make sure this task is finished
                //completion must be call either operarion success or fail
                completion(nil);
            }];
        }];
        [_arrTasks addObject:task];
    }
    
    
    //parallel calling
    [self makeParallelTask];
    
    //sequential calling
    [self makeSequentialTask];

}

-(void)makeParallelTask{
    //---call parallerOperations to make task perform parallely
    [SKTaskManager parallerOperations:_arrTasks completion:^{
        NSLog(@"all task completed");
    }];
    
}
-(void)makeSequentialTask{
    //---call sequenceOperations to make task perform Sequentially
    
    [SKTaskManager sequenceOperations:_arrTasks completion:^{
        NSLog(@"all task completed");
    }];
    
    
}


- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
