//
//  PolygonShape.m
//  assignment1b
//
//  Created by dyzma on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PolygonShape.h"

@implementation PolygonShape

@synthesize numberOfSides = numberOfSides, minimumNumberOfSides = minimumNumberOfSides, maximumNumberOfSides = maximumNumberOfSides;

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {

    if (self = [super init]) {
        self.minimumNumberOfSides = min;
        self.maximumNumberOfSides = max;
        self.numberOfSides = sides;
        self.names = @[@"?", @"??", @"???", @"Triangle", @"Quadrilateral", @"Pentagon", @"Hexagon",
                           @"Heptagon", @"Octagon", @"Nonagon", @"Decagon", @"Undecagon", @"Dodecagon", @"Tridecagon"];
    }
    
    return self;
}

- (id)initFiveSidedPolygon {
    return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
}

- (float)angleInDegrees {
    return (180 * (numberOfSides - 2) / (numberOfSides + 0.0));
}

- (float)angleInRadians {
    return (2 * M_PI * [self angleInDegrees]) / 360;
}

- (void) setNumberOfSides:(int)newNumberOfSides {
    NSAssert(newNumberOfSides > minimumNumberOfSides && newNumberOfSides < maximumNumberOfSides, @"Invalid number of sides");
    numberOfSides = newNumberOfSides;
}

- (void) setMinimumNumberOfSides:(int)newMinimumNumberOfSides {
    NSAssert(newMinimumNumberOfSides > 2, @"Invalid minimum number of sides");
    minimumNumberOfSides = newMinimumNumberOfSides;
}

- (void) setMaximumNumberOfSides:(int)newMaximumNumberOfSides {
    NSAssert(newMaximumNumberOfSides <= 12, @"Invalid maximum number of sides");
    maximumNumberOfSides = newMaximumNumberOfSides;
}

- (NSString*) name {
    return self.names[self.numberOfSides];
}

- (NSString*) description {
    return [NSString stringWithFormat:@"Hello I am a %d-sided polygon (aka a %@) with angles of %f degrees (%f radians).", self.numberOfSides, self.name, self.angleInDegrees, self.angleInRadians];
}

- (void) dealloc {
    NSLog(@"dealloc");
    
    [super dealloc];
}

@end
