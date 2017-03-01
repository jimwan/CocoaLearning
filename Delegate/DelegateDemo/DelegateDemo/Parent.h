//
//  Parent.h
//  DelegateDemo
//
//  Created by user on 8/31/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol showName <NSObject>

-(void) print;

@end

/***---------------------------------------***/

@interface Parent : NSObject<showName>

@property (nonatomic,copy) NSString *name;

-(id)initWithChild:(NSString*)name;

@end
