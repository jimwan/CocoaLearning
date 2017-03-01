//
//  Student.h
//  DelegateDemo
//
//  Created by user on 8/31/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parent.h"

@interface Student : NSObject


@property (strong) id<showName> delegate; //定义一个delegate，该delegate遵循showName协议;即学生委托他的家长输出自己的名字

@end
