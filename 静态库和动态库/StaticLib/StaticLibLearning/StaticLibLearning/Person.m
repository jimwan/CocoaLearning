//
//  Person.m
//  StaticLib
//
//  Created by jim on 11/3/17.
//  Copyright © 2017 trendmicro. All rights reserved.
//

#import "Person.h"

@interface Person()


@end

@implementation Person

- (NSInteger)age
{
    if(!_age)
    {
        _age = 20;
    }
    return _age;
}

- (NSString *)name
{
    if(!_name)
    {
        _name = @"jim";
    }
    return _name;
}

- (void)personInfo
{
    NSLog(@"%@ %ld",self.name,self.age);
}
@end
