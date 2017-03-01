//
//  MyThread.m
//  OperationQueueDemo
//
//  Created by user on 9/8/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "MyThread.h"

@implementation MyThread


- (NSString*)currentTime
{
    NSDate * now = [NSDate date];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"HH:mm:ss"];
    return [outputFormatter stringFromDate:now];
}

-(void)threadA
{
    NSLog(@"call thread A");
    int i=20;
    while(i>0)
    {
        NSLog(@"thread A %@",[self currentTime]);
        i--;
        sleep(1);
    }
}
-(void)threadB
{
    NSLog(@"call thread B");
    int i=20;
    while(i>0)
    {
        NSLog(@"thread B %@",[self currentTime]);
        i--;
        sleep(1);
    }
}

@end
