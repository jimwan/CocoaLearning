//
//  main.m
//  DelegateLearning2
//
//  Created by user on 9/23/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test2.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Test1 *t = [[Test1 alloc]init];
        Test2 *t2 = [[Test2 alloc]init];
       // t.m_delegate = t2;
        [t setM_delegate:t2];
        [t.m_delegate fun1];
    }
    return 0;
}
