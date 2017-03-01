//
//  AbstractPlugin.m
//  PluginLearning
//
//  Created by user on 8/20/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "AbstractPlugin.h"

#define kErrFormat @"%s not implemented in subclass %@"
#define kExceptName @"Not Implemented"

@implementation AbstractPlugin

- (NSString *)name
{
    NSString *reason = [NSString stringWithFormat:kErrFormat, _cmd, [self class]];
    @throw [NSException exceptionWithName:kExceptName
                                   reason:reason
                                 userInfo:nil];
}

- (IBAction)run:(id)sender
{
    NSString *reason = [NSString stringWithFormat:kErrFormat, _cmd, [self class]];
    @throw [NSException exceptionWithName:kExceptName
                                   reason:reason
                                 userInfo:nil];
}
@end
