//
//  AppDelegate.m
//  GourpContainer
//
//  Created by user on 1/4/17.
//  Copyright © 2017 trendmicro. All rights reserved.
//

#import "AppDelegate.h"

#define groupID     @"E8P47U2H32.com.trendmicro.test"


@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (atomic, strong) NSUserDefaults *defaults;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.defaults = [[NSUserDefaults alloc] init];

    [self.defaults addSuiteNamed:groupID];
    NSDictionary *dict = @{@"application1":@"11111"};
    [self.defaults setPersistentDomain:dict forName:groupID];

    [self.defaults synchronize];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
