//
//  AppDelegate.h
//  CocoaTest
//
//  Created by user on 5/5/16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    float previousValue;
    IBOutlet NSSlider *slider;
}

@end

