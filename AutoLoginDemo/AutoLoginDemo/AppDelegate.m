//
//  AppDelegate.m
//  AutoLoginDemo
//
//  Created by user on 8/27/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "AppDelegate.h"
#import <ServiceManagement/ServiceManagement.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)applicationWillFinishLaunching:(NSNotification *)notification
{
    // register url listener
    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self
                                                       andSelector:@selector(getUrl:withReplyEvent:)
                                                     forEventClass:kInternetEventClass
                                                        andEventID:kAEGetURL];
}

- (void)getUrl:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent
{

}

#define helperBundleID  @"a.jim.LoginHelper"

-(IBAction)enableAutoLogin:(id)sender
{
    // Setting login
    if (!SMLoginItemSetEnabled((CFStringRef)@"com.jim.LoginHelper",YES))
    {
        NSLog(@"SMLoginItemSetEnabled failed!");
    }
}

-(IBAction)disableAutoLogin:(id)sender
{
    // Setting login
    if (!SMLoginItemSetEnabled((CFStringRef)@"com.jim.LoginHelper",NO))
    {
        NSLog(@"SMLoginItemSetEnabled failed!");
    }
}

@end
