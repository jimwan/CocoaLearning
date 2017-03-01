//
//  AppDelegate.m
//  GroupContainer2
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

    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithDictionary:[self.defaults persistentDomainForName:groupID]];
    NSLog(@"%@",[dict objectForKey:@"application1"]);


    dict[@"application2"] = @"2222";
    [self.defaults setPersistentDomain:dict forName:groupID];

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
