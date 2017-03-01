//
//  XPCServer.m
//  XPCServer
//
//  Created by user on 9/7/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "XPCServer.h"

@implementation XPCServer

// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

- (void)display:(void (^)(void)) reply
{
    reply();
}
@end
