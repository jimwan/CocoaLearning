//
//  AppDelegate.m
//  DispatchQueue
//
//  Created by user on 3/13/17.
//  Copyright © 2017 trendmicro. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

    /*
        串行，先执行run1 再执行run2
     */
//    dispatch_queue_t createQueue = dispatch_queue_create("SerialQueue", nil);
//    dispatch_async(createQueue, ^(){
//        [self run1];
//    });
//    dispatch_async(createQueue, ^(){
//        [self run2];
//    });

    /*
        global queue，run1和run2并行
     */
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue, ^(){
//        [self run1];
//    });
//    dispatch_async(queue, ^(){
//        [self run2];
//    });

    /*
        main queue，同串行。不同的是main queue可以用来刷新UI
     */
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_async(mainQueue, ^(){
        [self run1];
    });
    dispatch_async(mainQueue, ^(){
        [self run2];
    });
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)run1
{
    for (int i=0; i<5; i++)
    {
        [NSThread sleepForTimeInterval:0.3f];
        NSLog(@"*Run1:%d",i);
    }
}

- (void)run2
{
    for (int i=0; i<5; i++)
    {
        [NSThread sleepForTimeInterval:0.3f];
        NSLog(@"*Run2:%d",i);
    }
}
@end
