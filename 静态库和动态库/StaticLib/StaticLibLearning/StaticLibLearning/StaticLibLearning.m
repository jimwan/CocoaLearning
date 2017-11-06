//
//  StaticLibLearning.m
//  StaticLibLearning
//
//  Created by jim on 11/3/17.
//  Copyright © 2017 trendmicro. All rights reserved.
//

#import "StaticLibLearning.h"
#import "Person.h"
@interface StaticLibLearning()

@property (nonatomic, strong) Person *p;
@end

@implementation StaticLibLearning

- (id)init
{
    self = [super init];
    if(self)
    {
        self.p = [[Person alloc]init];
    }
    
    return self;
}
- (void)outputPerson
{
    [_p personInfo];
}

@end
