//
//  MyWindow.h
//  RoundWindow
//
//  Created by user on 3/7/16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyWindow : NSWindow
{
    NSPoint initialLocation;
}

@property (assign) NSPoint initialLocation;

@end
