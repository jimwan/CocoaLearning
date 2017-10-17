//
//  ThirdView.m
//  CocoaTest
//
//  Created by user on 22/06/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import "ThirdView.h"

@implementation ThirdView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    self.layer.backgroundColor = [NSColor greenColor].CGColor;

}

@end
