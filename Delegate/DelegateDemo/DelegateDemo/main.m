//
//  main.m
//  DelegateDemo
//
//  Created by user on 8/31/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Student *stu = [[Student alloc]init];
        Parent *p1 = [[Parent alloc]initWithChild:@"jim"];
        stu.delegate = p1;
        [p1 print];

        Parent *p2 = [[Parent alloc]initWithChild:@"martin"];
        stu.delegate = p2;
        [p2 print];
    }
    return 0;
}
