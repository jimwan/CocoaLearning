//
//  AppDelegate.m
//  StaticLibTest
//
//  Created by jim on 11/3/17.
//  Copyright © 2017 trendmicro. All rights reserved.
//

#import "AppDelegate.h"
#import "StaticLibLearning.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    StaticLibLearning *lib = [[StaticLibLearning alloc]init];
    [lib outputPerson];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
