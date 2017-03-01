//
//  AppDelegate.m
//  DispatchLearning
//
//  Created by user on 3/7/16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSButton *btn;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    //[self dispatchTest];
    //[self dispatchGroupTest];
    [self dispatchApplyTest:5];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

// wait for a dispath to end
- (void)dispatchTest
{
    __block int i=0;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^void{
        while (i<20) {
            [NSThread sleepForTimeInterval:1]; 
            i++;
            NSLog(@"sleep %d seconds",i);
        }
        dispatch_async(dispatch_get_main_queue(),^void(){
            self.btn.title = @"asasa";
        });
    });

}

// wait for a group to end
- (void)dispatchGroupTest
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"group1");
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"group2");
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"group3");
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        self.btn.title = @"bbb";
    });  
}

// run a block x times
-(void)dispatchApplyTest:(size_t)t
{
    dispatch_apply(t, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^void(size_t index){
        NSLog(@"%ld",index);
        [NSThread sleepForTimeInterval:1];
    });
}
@end
