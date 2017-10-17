//
//  ProgressView.m
//  圆形进度条
//
//  Created by user on 26/05/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import "ProgressView.h"

#define centerX self.frame.size.width/2
#define centerY self.frame.size.height/2
#define r   80

@interface ProgressView()

@property (nonatomic, assign) CGFloat progressValue;
@property (nonatomic, weak) IBOutlet NSTextField *percentage;

@end

@implementation ProgressView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    [self draw];
}

- (void)draw
{
    BOOL clockwise = NO;
    // clockwise 为YES表示顺时针，为NO表示逆时针.起点为圆心的右边
    // 顺时针时圆的角度分别为： 上：90，右：0，下：-90，左：-180，上-270
    // 逆时针时圆的角度分别为： 上：-270，左：-180,下：-90，右：0，上90
    NSBezierPath *path = [NSBezierPath bezierPath];
    //顺时针
//    CGFloat endAngle = 90 - 360*_progressValue;
//    [path appendBezierPathWithArcWithCenter:NSMakePoint(centerX, centerY) radius:r startAngle:90 endAngle:endAngle clockwise:YES];
    //逆时针
    CGFloat endAngle = 90 + 360*(_progressValue-1);
    [path appendBezierPathWithArcWithCenter:NSMakePoint(centerX, centerY) radius:r startAngle:-270 endAngle:endAngle clockwise:clockwise];
    [[NSColor redColor]set];
    [path setLineWidth:5];
    [path setLineCapStyle:NSRoundLineCapStyle];
    [path stroke];
    
    _percentage.stringValue = [NSString stringWithFormat:@"%d%%",(int)(_progressValue*100)];
}

- (void)setProgressValue:(CGFloat)progressValue
{
    _progressValue = progressValue;
    [self setNeedsDisplay:YES];
}
@end
