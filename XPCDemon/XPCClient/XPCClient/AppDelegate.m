//
//  AppDelegate.m
//  XPCClient
//
//  Created by user on 9/7/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "AppDelegate.h"
#import "XPCServer.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (strong) NSXPCConnection *connectionToService;
@property (weak) IBOutlet NSTextField *lower;
@property (weak) IBOutlet NSTextField *upper;
@property (nonatomic,copy) NSString *myString;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _connectionToService = [[NSXPCConnection alloc] initWithServiceName:@"com.jim.XPCServer"];
    _connectionToService.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
    [_connectionToService resume];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    [_connectionToService invalidate];
}

- (IBAction)do:(id)sender
{
    // 在callback 的block里调用NSLog经常看不到输出，但代码确实是执行了
    void (^myReply)(NSString *)= ^void(NSString *str){
        [_upper setStringValue:str];
    };
    void (^myReply2)() = ^void(){
        _myString = @"huuu";
    };
    [[_connectionToService remoteObjectProxy] upperCaseString:[_lower stringValue] withReply:myReply];
    [[_connectionToService remoteObjectProxy] display:myReply2];

}
@end
