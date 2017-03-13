//
//  AppDelegate.m
//  server
//
//  Created by user on 3/3/17.
//  Copyright © 2017 trendmicro. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreFoundation/CoreFoundation.h>

#include <sys/socket.h>
#include <netinet/in.h>

#define PORT 9000


@interface AppDelegate ()<NSStreamDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, retain) NSInputStream *inputStream;

@property (nonatomic, retain) NSOutputStream *outputStream;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)initNetworkCommunication

{

    CFReadStreamRef readStream;

    CFWriteStreamRef writeStream;

    CFStreamCreatePairWithSocketToHost(NULL,

                                       (CFStringRef)@"192.168.1.103", PORT, &readStream, &writeStream);

    _inputStream = (__bridge_transfer NSInputStream *)readStream;

    _outputStream = (__bridge_transfer NSOutputStream*)writeStream;

    [_inputStream setDelegate:self];

    [_outputStream setDelegate:self];

    [_inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop]

                            forMode:NSDefaultRunLoopMode];

    [_outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop]
     
                             forMode:NSDefaultRunLoopMode];
    
    [_inputStream open];
    
    [_outputStream open];
    
}

- (IBAction)sendData:(id)sender {

    flag = 0;

    [self initNetworkCommunication];
    
}


- (IBAction)receiveData:(id)sender {

    flag = 1;

    [self initNetworkCommunication];
    
}
@end
