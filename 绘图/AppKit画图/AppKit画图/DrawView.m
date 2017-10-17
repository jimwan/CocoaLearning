//
//  DrawView.m
//  AppKit画图
//
//  Created by user on 27/05/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    [[NSColor whiteColor]set];
    NSRectFill(dirtyRect);
    // Drawing code here.
    //[self drawText];
    [self drawImage];
}


- (void)drawText
{
    NSString *str = @"Hello";
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [NSFont fontWithName:@"Helvetica" size:30];
    attr[NSForegroundColorAttributeName] = [NSColor redColor];
    attr[NSStrokeColorAttributeName] = [NSColor greenColor];
    attr[NSStrokeWidthAttributeName] = @3;
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [NSColor blackColor];
    shadow.shadowOffset = NSMakeSize(1, 1);
    shadow.shadowBlurRadius = 2;
    attr[NSShadowAttributeName] = shadow;
    
    [str drawAtPoint:NSZeroPoint withAttributes:attr];
    // drawInRect 会自动换行
    //[str drawInRect:self.frame withAttributes:attr];
}

- (void)drawImage
{
    NSImage *image = [NSImage imageNamed:@"1"];

    //[image drawAtPoint:NSZeroPoint fromRect:self.bounds operation:NSCompositingOperationClear fraction:0];
    NSBezierPath *path = [NSBezierPath bezierPathWithOvalInRect:self.bounds];
    [path addClip];
    
    //NSRectClip(NSMakeRect(10, 10, self.bounds.size.width-20,self.bounds.size.height-20));
    [image drawInRect:self.bounds];
    //[image drawAtPoint:NSZeroPoint fromRect:NSMakeRect(20, 20, self.bounds.size.width, self.bounds.size.height) operation:NSCompositingOperationCopy fraction:1];


}
@end
