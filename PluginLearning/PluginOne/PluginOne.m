//
//  PluginOne.m
//  PluginLearning
//
//  Created by user on 8/20/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "PluginOne.h"



@implementation PluginOne

- (id)init
{
    self = [super init];
    if(self)
    {
        [NSBundle loadNibNamed:@"PluginOneMainWindow" owner:self];
    }
    return self;
}

- (NSString *)name
{
    return @"Plugin One";
}

- (IBAction)run:(id)sender;
{
    [_mainWindow center];
    [_mainWindow makeKeyAndOrderFront:sender];
}

- (IBAction)closeWindow:(id)sender;
{
    [_mainWindow orderOut:sender];
}

@end
