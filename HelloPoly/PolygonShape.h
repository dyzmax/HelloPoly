//
//  PolygonShape.h
//  assignment1b
//
//  Created by dyzma on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolygonShape : NSObject

@property(nonatomic) int numberOfSides;
@property(nonatomic) int minimumNumberOfSides;
@property(nonatomic) int maximumNumberOfSides;
@property(readonly) float angleInDegrees;
@property(readonly) float angleInRadians;
@property(readonly) NSString *name;
@property(retain, nonatomic) NSArray *names;

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max;

@end
