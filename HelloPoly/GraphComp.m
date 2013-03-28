//
//  GraphComp.m
//  HelloPoly
//
//  Created by dyzma on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GraphComp.h"

@implementation GraphComp

+ (double) vectorAngle: (CGPoint) a b: (CGPoint) b {
    if ((a.x == 0 && a.y == 0) || (b.x == 0 && b.y == 0)) {
        return 0;
    }
    
    //return acos((a.x * b.x + a.y * b.y)/(sqrt(a.x*a.x + a.y*a.y)*sqrt(b.x*b.x + b.y*b.y)));
    //atan2(v2.y,v2.x) - atan2(v1.y,v1.x)
    return atan2(b.y, b.x) - atan2(a.y, a.x);
}

+ (CGPoint) translate: (CGPoint) sourceVector translationVector: (CGPoint) translation {
    CGPoint point = CGPointMake(sourceVector.x - translation.x, - (sourceVector.y - translation.y));
    
    return point;
}


@end
