//
//  MyView.m
//  CocoaTest
//
//  Created by user on 11/24/16.
//  Copyright © 2016 trendmicro. All rights reserved.
//

#import "MyView.h"
#import "MyBezierPath.h"
@interface MyView()

@property (nonatomic) MyBezierPath *path;
@property (strong) NSTrackingArea * trackArea;

@property (nonatomic,strong) NSMutableArray *pathArray;

@property (nonatomic,assign) BOOL brushMode;

@property (nonatomic,strong) NSColor *lineColor;

@end

@implementation MyView


-(void)awakeFromNib
{
    _pathArray = [NSMutableArray array];
    _lineColor = [NSColor blackColor];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    self.wantsLayer = YES;
    self.layer.backgroundColor = [NSColor whiteColor].CGColor;

    
    for(MyBezierPath *each in self.pathArray)
    {
        [each setLineWidth:each.width];
        [each.color setStroke];
        [each stroke];
    }
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
    //CGPathAddLineToPoint(self.path, nil, position.x, position.y);
    [self.path lineToPoint:position];
    [self setNeedsDisplay:YES];
}


- (void)mouseDown:(NSEvent *)theEvent{
    NSPoint position = [theEvent locationInWindow];
    //NSPoint position = [self convertPoint:point fromView:nil];
    //CGPathMoveToPoint(self.path, nil, position.x, position.y);
    
    MyBezierPath *path = [[MyBezierPath alloc]init];
    path.color = self.lineColor;
    if(_brushMode)
        path.width = 10;
    
    self.path = path;
    [path moveToPoint:position];
 
    [self.pathArray addObject:path];
}

-(void)undo:(id)sender
{
    [self.pathArray removeLastObject];
    [self setNeedsDisplay:YES];
}

-(void)removeAll:(id)sender
{
    [self.pathArray removeAllObjects];
    [self setNeedsDisplay:YES];
}

-(void)erase:(id)sender
{
    _lineColor = [NSColor whiteColor];
    _brushMode = YES;
}

-(void)draw:(id)sender
{
    _lineColor = [NSColor blackColor];
    _brushMode = NO;
}

-(void)changeColor:(NSColor*)color
{
    _lineColor = color;
}

-(void)save:(id)sender
{
    //NSImage* anImage =  [self swatchWithColor:[NSColor whiteColor] size:self.bounds.size]; //or some other source
    NSImage* anImage = [NSImage imageNamed:@"1"];
    //create a bitmap at a specific size
    NSRect offscreenRect = self.bounds;
    NSBitmapImageRep* bitmap = [[NSBitmapImageRep alloc] initWithBitmapDataPlanes:nil
                                                                       pixelsWide:offscreenRect.size.width
                                                                       pixelsHigh:offscreenRect.size.height
                                                                    bitsPerSample:8
                                                                  samplesPerPixel:4
                                                                         hasAlpha:YES
                                                                         isPlanar:NO
                                                                   colorSpaceName:NSCalibratedRGBColorSpace
                                                                     bitmapFormat:0
                                                                      bytesPerRow:(4 * offscreenRect.size.width)
                                                                     bitsPerPixel:32];
    
    //save the current graphics context and lock focus on the bitmap
    NSGraphicsContext* originalContext = [NSGraphicsContext currentContext];
    [NSGraphicsContext setCurrentContext:[NSGraphicsContext
                                          graphicsContextWithBitmapImageRep:bitmap]];
    [NSGraphicsContext saveGraphicsState];
    

    //scale and draw the image
    [anImage setSize:offscreenRect.size];
    [anImage drawAtPoint:NSZeroPoint fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
    
    for(MyBezierPath *each in self.pathArray)
    {
        [each setLineWidth:each.width];
        [each.color setStroke];
        [each stroke];
    }

    
    //restore the original graphics context
    [NSGraphicsContext restoreGraphicsState];
    [NSGraphicsContext setCurrentContext:originalContext];
    
    //get PNG data from the image rep
    NSData* pngData = [bitmap representationUsingType:NSPNGFileType properties:nil];
    [pngData writeToURL:[NSURL fileURLWithPath:@"/Users/user/Desktop/1.png"]  atomically:YES];

}

- (NSImage *)swatchWithColor:(NSColor *)color size:(NSSize)size
{
    NSImage *image = [[NSImage alloc] initWithSize:size] ;
    [image lockFocus];
    [color drawSwatchInRect:NSMakeRect(0, 0, size.width, size.height)];
    [image unlockFocus];
    return image;
}

@end
