//
//  main.m
//  CustomOperation
//
//  Created by user on 9/22/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomOperation.h"

NSString* currentTime()
{
    NSDate * now = [NSDate date];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"HH:mm:ss"];
    return [outputFormatter stringFromDate:now];
}

void mainThread( NSOperationQueue  *queue)
{
    NSLog(@"call main thread");
    int i=20;
    while(i>0)
    {
        NSLog(@"main thread %d",i);
        if(i==17)
        {
            [queue cancelAllOperations];  // this will call -[NSOperation cancel], and -[NSOperation isCancelled] to return YES
        }
        i--;
        sleep(1);
    }

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        CustomOperation *oper = [[CustomOperation alloc]init];
        NSOperationQueue  *queue = [[NSOperationQueue alloc]init];
        [queue addOperation:oper];  // this will call the main() of CustomOperation
        mainThread(queue);
        NSLog(@"count of queue: %ld",queue.operationCount);
    }
    return 0;
}
