//
//  CustomOperation.h
//  CustomOperation
//
//  Created by user on 9/22/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomOperation : NSOperation

@property (strong) id  myData;
-(id)initWithData:(id)data;

@end
