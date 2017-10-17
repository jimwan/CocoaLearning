//
//  MyView.m
//  CVDisplayLink学习
//
//  Created by user on 31/05/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import "MyView.h"

static int y=10;

@implementation MyView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSImage *image = [NSImage imageNamed:@"icon"];
    [image drawInRect:NSMakeRect(20, y, 32, 32)];
}

CVReturn displayLinkOutputCallback(
                                   CVDisplayLinkRef displayLink,
                                   const CVTimeStamp *inNow,
                                   const CVTimeStamp *inOutputTime,
                                   CVOptionFlags flagsIn,
                                   CVOptionFlags *flagsOut,
                                   void *displayLinkContext)
{
    MyView *self = (__bridge MyView *)displayLinkContext;
   // [self animate];
    [self performSelectorOnMainThread:@selector(animate) withObject:nil waitUntilDone:NO];
    return kCVReturnSuccess;
}


- (void)animate {
    // Animate
    if( y>= self.frame.size.height)
        y = 10;
    else
        y+= 10;
    
    [self setNeedsDisplay:YES];
    //NSLog(@"asas");
}



- (void)awakeFromNib
{
    
    CVDisplayLinkCreateWithActiveCGDisplays(&displayLinkRef);
    CVDisplayLinkSetOutputCallback(displayLinkRef, displayLinkOutputCallback, (__bridge void *)self);
    CVDisplayLinkStart(displayLinkRef);
}
@end
