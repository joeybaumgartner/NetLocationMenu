//
//  jbcNetworkSet.m
//  NetLocationMenu
//
//  Created by Joe Baumgartner on 2013-03-16.
//  Copyright (c) 2013 Joe Baumgartner. All rights reserved.
//

#import "jbcNetworkSet.h"

@implementation jbcNetworkSet

-(id)init
{
    _name = nil;
    _setID = nil;

    return self;
}

-(id)initWithName:(NSString*)n andSetID:(NSString *)i
{
    _name = [NSString stringWithString:n];
    _setID = [NSString stringWithString:i];
    
    return self;
}

@end
