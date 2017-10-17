//
//  MyBezierPath.m
//  CocoaTest
//
//  Created by user on 08/06/2017.
//  Copyright © 2017 trendmicro. All rights reserved.
//

#import "MyBezierPath.h"

@implementation MyBezierPath

- (id)init
{
    self = [super init];
    if(self)
    {
        _width = 1;
        _color = [NSColor blackColor];
    }
    return self;
}

@end
