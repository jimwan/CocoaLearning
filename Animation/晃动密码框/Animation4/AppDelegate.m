//
//  AppDelegate.m
//  Animation4
//
//  Created by user on 11/3/16.
//  Copyright © 2016 trendmicro. All rights reserved.
//

#import "AppDelegate.h"
#import "SecurityView.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSView *view;
@property (weak) IBOutlet NSButton *checkbox;

@property (weak) IBOutlet SecurityView *pwdBox;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.view.wantsLayer = YES;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}



- (IBAction)shack:(id)sender {
    [self.pwdBox shackAnimation];
}

- (IBAction)showPassword:(id)sender
{
    self.pwdBox.encrypted = !((NSButton*)sender).state;
    [self.pwdBox showPassword:((NSButton*)sender).state];
}
@end
