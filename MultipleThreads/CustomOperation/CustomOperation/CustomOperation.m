//
//  CustomOperation.m
//  CustomOperation
//
//  Created by user on 9/22/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "CustomOperation.h"

@implementation CustomOperation

- (id)initWithData:(id)data {
    if (self = [super init])
        _myData = data;
    return self;
}

- (void) mainThread
{
    NSLog(@"call custom operation");
    int i=20;
    while(i>0)
    {
        NSLog(@"operation thread %d",self.isCancelled);
        if(self.isCancelled)
        {
            NSLog(@"** operation cancelled **");
            break;
        }
        i--;
        sleep(1);
    }

}


-(void) main
{
    if ([self isCancelled]) {
        NSLog(@"** operation cancelled **");
    }

    // Do some work here
    NSLog(@"Working... working....");
    [self mainThread];
    
    if ([self isCancelled]) {
        NSLog(@"** operation cancelled **");
    }
    // Do any clean-up work here...

    // If you need to update some UI when the operation is complete, do this:
    //[self performSelectorOnMainThread:@selector(updateButton) withObject:nil waitUntilDone:NO];

    NSLog(@"Operation finished");
}
@end
