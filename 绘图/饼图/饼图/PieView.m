//
//  PieView.m
//  饼图
//
//  Created by user on 25/05/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import "PieView.h"

#define viewWidth self.frame.size.width
#define viewHeight self.frame.size.height
#define centerX (viewWidth/2)*0.5
#define centerX2 (viewWidth/2)*1.5
#define centerY viewHeight/2
#define r 100

@implementation PieView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    [self drawPie];
    [self drawPie2];

}


- (void)mouseUp:(NSEvent *)event
{
    [self setNeedsDisplay:YES];
}

- (NSColor*)randomColor
{
    CGFloat red = arc4random_uniform(256)/255.0;
    CGFloat green = arc4random_uniform(256)/255.0;
    CGFloat blue = arc4random_uniform(256)/255.0;
    return [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:1.0f];
}

// 用NSBezierPath
- (void)drawPie
{
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path appendBezierPathWithArcWithCenter:NSMakePoint(centerX, centerY) radius:r startAngle:0 endAngle:70 clockwise:0];
    [[self randomColor]set];
    [path lineToPoint:NSMakePoint(centerX, centerY)];
    [path fill];
    
    NSBezierPath *path2 = [NSBezierPath bezierPath];
    [path2 appendBezierPathWithArcWithCenter:NSMakePoint(centerX, centerY) radius:r startAngle:70 endAngle:190 clockwise:0];
    [[self randomColor]set];
    [path2 lineToPoint:NSMakePoint(centerX, centerY)];
    [path2 fill];
    
    NSBezierPath *path3 = [NSBezierPath bezierPath];
    [path3 appendBezierPathWithArcWithCenter:NSMakePoint(centerX, centerY) radius:r startAngle:190 endAngle:360 clockwise:0];
    [[self randomColor]set];
    [path3 lineToPoint:NSMakePoint(centerX, centerY)];
    [path3 fill];

}

// 使用Core Graphics
- (void)drawPie2
{
    CGContextRef context = [NSGraphicsContext currentContext].CGContext;
    
    CGContextSetFillColorWithColor(context,[self randomColor].CGColor);//画笔线的颜色
    CGContextSetLineWidth(context, 1.0);//线的宽度
    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    CGContextMoveToPoint(context, centerX2, centerY);
    CGContextAddArc(context,centerX2, centerY, r, M_PI*0, M_PI*0.5, 0); //添加一个圆
    //CGContextClosePath(context);
    CGContextFillPath(context);
    
    
    
    CGContextSetFillColorWithColor(context,[self randomColor].CGColor);//画笔线的颜色
    CGContextMoveToPoint(context, centerX2, centerY);
    CGContextAddArc(context,centerX2, centerY, r, M_PI*0.5, M_PI*1.2, 0); //添加一个圆
    //CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGContextSetFillColorWithColor(context,[self randomColor].CGColor);//画笔线的颜色
    CGContextMoveToPoint(context, centerX2, centerY);
    CGContextAddArc(context,centerX2, centerY, r, M_PI*1.2, M_PI*2.0, 0); //添加一个圆
    //CGContextClosePath(context);
    CGContextFillPath(context);

}
@end
