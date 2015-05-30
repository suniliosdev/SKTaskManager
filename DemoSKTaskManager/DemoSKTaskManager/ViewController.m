//
//  ViewController.m
//  DemoSKTaskManager
//
//  Created by Sunil on 5/30/15.
//  Copyright (c) 2015 Sunil. All rights reserved.
//

#import "ViewController.h"
#import <SKTaskManager/SKTaskManager.h>
@interface ViewController (){

}
@property(nonatomic,strong) NSMutableArray *arrTasks;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
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
    

    BOOL shouldCallParallel=YES;
    //change bool value to NO if you want to call it Sequential
    
    if (shouldCallParallel) {
        //parallel calling
        [self makeParallelTask];
    }else{
        //sequential calling
        //[self makeSequentialTask];
    }
    
}

-(void)makeParallelTask{
    //---call parallerOperations to make async tasks perform Parallely
    [SKTaskManager parallerOperations:_arrTasks completion:^{
        NSLog(@"all Paraller task completed");
    }];
    
}
-(void)makeSequentialTask{
    //---call sequenceOperations to make async tasks perform Sequentially
    
    [SKTaskManager sequenceOperations:_arrTasks completion:^{
        NSLog(@"all Sequential task completed");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
