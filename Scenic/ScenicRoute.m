//
//  ScenicRoute.m
//  Scenic
//
//  Created by Jack Reilly on 3/14/11.
//  Copyright 2011 UC Berkeley. All rights reserved.
//

#import "ScenicRoute.h"
#import "ScenicContent.h"

@implementation ScenicRoute

@synthesize gRoute, endRequest, startRequest, waypointRequests, scenicContents;

-(id) init {
    if ((self = [super init])) {
        self.waypointRequests = [[[NSMutableArray alloc] init] autorelease];
        self.scenicContents = [[[NSMutableArray alloc] init] autorelease];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super init])) {
        self.startRequest = [aDecoder decodeObject];
        self.endRequest = [aDecoder decodeObject];
        if (!(self.waypointRequests = [aDecoder decodeObject])) {
            self.waypointRequests = [[[NSMutableArray alloc] init] autorelease];
        }
        if (!(self.scenicContents = [aDecoder decodeObject])) {
            self.scenicContents = [[[NSMutableArray alloc] init] autorelease];
        }
        self.gRoute = [aDecoder decodeObject];
        
    }
    return self;
}

+(id) routeWithScenicRoute: (ScenicRoute*) route andGMapsRoute: (GMapsRoute*) _gRoute {
    ScenicRoute* newRoute = [[ScenicRoute alloc] init];
    newRoute.startRequest = route.startRequest;
    newRoute.endRequest = route.endRequest;
    newRoute.waypointRequests = [NSMutableArray arrayWithArray:route.waypointRequests];
    newRoute.scenicContents = [NSMutableArray arrayWithArray:route.scenicContents];
    newRoute.gRoute = _gRoute;
    return [newRoute autorelease];
    
}

-(void) addContent: (ScenicContent*) content {
    [self.scenicContents addObject:content];
    [self.waypointRequests addObject:[content.coord pairString]];
}

-(void) removeContent: (ScenicContent*) content {
    [self.scenicContents removeObject:content];
    [self.waypointRequests removeObject:[content.coord pairString]];
}

-(GMapsCoordinate*) startCoord {
    return [self.gRoute startCoord];
}

-(void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.startRequest];
    [aCoder encodeObject:self.endRequest];
    [aCoder encodeObject:self.waypointRequests];
    [aCoder encodeObject:self.scenicContents];
    [aCoder encodeObject:self.gRoute];
    
}

@end
