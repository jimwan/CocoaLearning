//
//  MyView.m
//  CocoaTest
//
//  Created by user on 11/24/16.
//  Copyright © 2016 trendmicro. All rights reserved.
//

#import "MyView.h"

@interface MyView()

@property (nonatomic) CGMutablePathRef path;
@property (strong) NSTrackingArea * trackArea;

@end

@implementation MyView


-(void)awakeFromNib
{
    self.path = CGPathCreateMutable();

}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    CGContextRef context = [NSGraphicsContext currentContext].CGContext;
//    CGPathMoveToPoint(self.path, nil, 20,20);
//    CGPathAddLineToPoint(self.path, nil, 100, 100);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextAddPath(context, self.path);
    CGContextStrokePath(context);

}

-(void)updateTrackingAreas
{
    if (self.trackArea) {
        [self removeTrackingArea:self.trackArea];
    }

    self.trackArea = [[NSTrackingArea alloc] initWithRect:self.bounds
                                                  options:NSTrackingMouseEnteredAndExited | NSTrackingEnabledDuringMouseDrag | NSTrackingInVisibleRect | NSTrackingActiveInKeyWindow
                                                    owner:self
                                                 userInfo:nil];
    [self addTrackingArea:self.trackArea];

    [super updateTrackingAreas];
    
    
    
}

- (void)mouseDragged:(NSEvent *)theEvent
{
    NSPoint position = [theEvent locationInWindow];
    //NSPoint position = [self convertPoint:point fromView:nil];
    CGPathAddLineToPoint(self.path, nil, position.x, position.y);
    [self setNeedsDisplay:YES];
}


- (void)mouseDown:(NSEvent *)theEvent{
    NSPoint position = [theEvent locationInWindow];
    //NSPoint position = [self convertPoint:point fromView:nil];
    CGPathMoveToPoint(self.path, nil, position.x, position.y);
}


@end
