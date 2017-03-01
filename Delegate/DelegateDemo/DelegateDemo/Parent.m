//
//  Parent.m
//  DelegateDemo
//
//  Created by user on 8/31/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "Parent.h"

@implementation Parent

-(id)initWithChild:(NSString*)name
{
    self = [super init];
    if(self)
    {
        _name = name;
    }
    return self;
}


-(void) print
{
    NSLog(@"name is %@",_name);
}
@end
