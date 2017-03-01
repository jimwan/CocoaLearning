//
//  Person.m
//  ArrayControllerAndTableView
//
//  Created by user on 8/21/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "Person.h"

@interface Person()


@property (readwrite,copy)    NSString *name;
@property (readwrite)    NSInteger age;


@end

@implementation Person

- (id)init
{
    self = [super init];
    if(self)
    {
        _name = @"Person";
        _age = 20;
    }
    return self;
}

- (id)initWithName:(NSString*)name andAge:(NSInteger)age
{
    self = [super init];
    if(self)
    {
        _name = name;
        _age = age;
    }
    return self;
}
@end
