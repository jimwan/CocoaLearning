//
//  main.m
//  OperationQueueDemo
//
//  Created by user on 9/8/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyThread.h"

NSString* currentTime()
{
    NSDate * now = [NSDate date];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"HH:mm:ss"];
    return [outputFormatter stringFromDate:now];
}

void mainThread()
{
    NSLog(@"call main thread");
    int i=20;
    while(i>0)
    {
        NSLog(@"main thread %@",currentTime());
        i--;
        sleep(1);
    }

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        MyThread *thread = [[MyThread alloc]init];
        NSInvocationOperation *operationA = [[NSInvocationOperation alloc]initWithTarget:thread selector:@selector(threadA) object:nil];
        NSInvocationOperation *operationB = [[NSInvocationOperation alloc]initWithTarget:thread selector:@selector(threadB) object:nil];
        NSOperationQueue  *queue = [[NSOperationQueue alloc]init];
        //[queue setMaxConcurrentOperationCount:1];
        [queue addOperation:operationA];
        [queue addOperation:operationB];
        NSLog(@"count of queue: %ld",queue.operationCount);
        mainThread();
    }
    return 0;
}
