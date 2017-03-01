//
//  AppDelegate.m
//  LoginHelper
//
//  Created by user on 8/27/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

// set "Application is agent (UIElement)" in info.plist

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSString *appPath = [[NSBundle mainBundle] bundlePath];
    appPath = [appPath stringByReplacingOccurrencesOfString:@"/Contents/Library/LoginItems/LoginHelper.app" withString:@""];
    appPath = [appPath stringByAppendingPathComponent:@"Contents/MacOS/AutoLoginDemo"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:appPath])
    {
        return;
    }
    NSArray *runningArray = [NSRunningApplication runningApplicationsWithBundleIdentifier:@"com.jim.AutoLoginDemo"];
    if ([runningArray count] > 0)
    {
        return;
    }
    [[NSWorkspace sharedWorkspace] launchApplication:appPath];

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
