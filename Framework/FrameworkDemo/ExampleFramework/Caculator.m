//
//  Caculator.m
//  FrameworkDemo
//
//  Created by user on 8/20/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "Caculator.h"

@implementation Caculator

- (int)add:(int)a with:(int) b
{
    return a+b;
}

- (int)subtract:(int) a with:(int) b
{
    return a-b;
}

- (int)mutiply:(int) a with:(int) b
{
    return a*b;
}

- (int)divide:(int) a with:(int) b
{
    if(b==0) return 0;
    return a/b;
}
@end
