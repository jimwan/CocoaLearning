//
//  AppDelegate.m
//  BlockLearning2
//
//  Created by user on 3/3/16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic)  int a;
@property (nonatomic)  int b;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

    }

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(void)blockTestNoArgs:(void(^)())completeBlock
{
    completeBlock();
}

-(void)blockTestWithArgs:(int(^)(int,int))completeBlock
{

    NSLog(@"blockTestWithArgs: %d",completeBlock(_a,_b));
}


- (IBAction)test:(id)sender {

    void (^noArgsBlock)()= ^void(){
        NSLog(@"noArgsBlock");
    };

    int (^withArgsBlock)(int,int) = ^int(int a,int b){
        return a+b;
    };

    _a = 1;
    _b = 2;

    [self blockTestNoArgs:noArgsBlock];
    [self blockTestWithArgs:withArgsBlock];
    [self blockTestWithArgs:^int(int a, int b) {
        return a+b;
    }];
}

@end
