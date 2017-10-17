//
//  MyView.m
//  NSView动画
//
//  Created by user on 23/06/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    self.layer.backgroundColor = [NSColor redColor].CGColor;
    
}


- (void)mouseUp:(NSEvent *)event
{
    NSLog(@"%s",__func__);
}
@end
