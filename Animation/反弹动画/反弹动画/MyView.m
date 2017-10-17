//
//  MyView.m
//  反弹动画
//
//  Created by user on 27/06/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import "MyView.h"
#import <QuartzCore/QuartzCore.h>


@interface MyView()
@property (weak) IBOutlet NSImageView *pigView;


@end
@implementation MyView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (IBAction)go:(id)sender {
    
    CASpringAnimation *animation = [CASpringAnimation animationWithKeyPath:@"position.x"];
    animation.duration = 1;
    animation.toValue = @(300);
    // 阻尼系数
    //animation.damping = 1;
    // 刚度系数: (劲度系数 / 弹性系数): 系数越大,形变的产生的力越大, 运动越快
    animation.stiffness = 120;  //这个值控制来回弹
    // 质量: 影响图层运动时候的惯性, 质量越大弹簧拉伸和压缩的幅度越大 (动画的幅度,波动变大)
    animation.mass = 5;
    
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [_pigView.layer addAnimation:animation forKey:nil];
    
}

@end
