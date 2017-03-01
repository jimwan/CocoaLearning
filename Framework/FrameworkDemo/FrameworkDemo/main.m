//
//  main.m
//  FrameworkDemo
//
//  Created by user on 8/20/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ExampleFramework/ExampleFramework.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Caculator *cal = [[Caculator alloc]init];
        int a = [cal add:3 with:4];
        int b = [cal subtract:3 with:4];
        int c = [cal mutiply:3 with:4];
        int d = [cal divide:4 with:2];
        NSLog(@"%d %d %d %d",a,b,c,d);
    }
    return 0;
}
