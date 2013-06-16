//
//  jbcAppController.m
//  NetLocationMenu
//
//  Created by Joe Baumgartner on 2013-03-15.
//  Copyright (c) 2013 Joe Baumgartner. All rights reserved.
//

#import "jbcAppController.h"
#import <SystemConfiguration/SystemConfiguration.h>

@implementation jbcAppController

-(id)init
{
    SCPreferencesRef x = SCPreferencesCreate(NULL, CFSTR("SystemConfiguration"), NULL);
    NSArray *netRefs = (__bridge NSArray*)(SCNetworkSetCopyAll(x));
    
    networkSets = [[NSMutableArray alloc] init];
    
    for(id item in netRefs) {
        NSString *name = (__bridge NSString *)SCNetworkSetGetName((__bridge SCNetworkSetRef)item);
        NSString *setID = (__bridge NSString *)SCNetworkSetGetSetID((__bridge SCNetworkSetRef)item);
        
        jbcNetworkSet *currentSet = [[jbcNetworkSet alloc] initWithName:name andSetID:setID];
        [networkSets addObject:currentSet];
    }
    
    CFRelease(x);
    return self;
}

-(void)setNetworkSets:(NSArray *)a
{
    if(a == networkSets)
        return;
    
    a = networkSets;
}

-(NSUInteger)numberOfRowsInTableView:(NSTableView *)tv
{
    return [_locations count];
}

-(id)tableView:(NSTableView *)tv objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSUInteger)row
{
    NSString *v = [_locations objectAtIndex:row];
    return v;
}

-(IBAction)setCurrentNetworkSet:(id)sender
{
    NSInteger row = [_table selectedRow];
    jbcNetworkSet *set = (jbcNetworkSet *)[networkSets objectAtIndex:row];
    
    SCPreferencesRef x = SCPreferencesCreate(NULL, CFSTR("SystemConfiguration"), NULL);
    SCNetworkSetRef netRef;
    
    if(x != NULL)
        netRef = (SCNetworkSetCopy(x, (__bridge CFStringRef)([set setID])));
    else
        return;
    
    Boolean successful = SCNetworkSetSetCurrent(netRef);
    
    if(successful)
        NSLog(@"Setting current network set to %@", [set name]);
    else
        NSLog(@"Change didn't occur");
    
    successful = SCPreferencesApplyChanges(x);
    
    if(successful)
        NSLog(@"Changes commited to permanent storage");
    else {
        NSLog(@"Changes not saved. Error code: %d", SCError());
    }
    
    CFRelease(x);
}

@end
