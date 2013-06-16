//
//  jbcAppController.h
//  NetLocationMenu
//
//  Created by Joe Baumgartner on 2013-03-15.
//  Copyright (c) 2013 Joe Baumgartner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "jbcNetworkSet.h"

@interface jbcAppController : NSObject
{
    NSMutableArray *networkSets;
}

//-(void)setNetworkSets:(NSArray *)a;

-(IBAction)setCurrentNetworkSet:(id)sender;

@property (strong) IBOutlet NSTableView *table;
@property (strong) NSMutableArray *locations;
@end
