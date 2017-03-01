//
//  Test1.h
//  DelegateLearning2
//
//  Created by user on 9/23/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol TestProtocol

- (void) fun1;

@end

@interface Test1 : NSObject


@property (strong) id<TestProtocol> m_delegate;

@end
