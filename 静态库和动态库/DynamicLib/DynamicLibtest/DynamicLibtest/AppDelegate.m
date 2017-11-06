//
//  AppDelegate.m
//  DynamicLibtest
//
//  Created by jim on 11/3/17.
//  Copyright © 2017 trendmicro. All rights reserved.
//

#import "AppDelegate.h"
#import "DynamicTest.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

    
    [[DynamicTest alloc]outputInfo];
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
