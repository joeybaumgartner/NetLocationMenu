//
//  jbcNetworkSet.h
//  NetLocationMenu
//
//  Created by Joe Baumgartner on 2013-03-16.
//  Copyright (c) 2013 Joe Baumgartner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>

@interface jbcNetworkSet : NSObject

@property (strong) NSString *name;
@property (strong) NSString *setID;

-(id)initWithName:(NSString*)n andSetID:(NSString *)i;

@end