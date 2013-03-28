//
//  PolyView.m
//  HelloPoly
//
//  Created by dyzma on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PolyView.h"
#import "PolygonShape.h"
#import <QuartzCore/QuartzCore.h>

@interface PolyView()

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;

@end


@implementation PolyView

@synthesize poly;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSArray *points = [PolyView pointsForPolygonInRect:rect numberOfSides:poly.numberOfSides];
    
    CGContextBeginPath (context);
    
    NSValue *value = [points objectAtIndex:0];
    CGPoint point = [value CGPointValue];
    CGContextMoveToPoint(context, point.x, point.y);
    
    for (int i = 1; i < [points count]; i++) {
        NSValue *value = [points objectAtIndex:i];
        CGPoint point = [value CGPointValue];
        CGContextAddLineToPoint (context, point.x, point.y);
    }
    CGContextClosePath (context);
    
    [[UIColor redColor] setFill];
    [[UIColor blackColor] setStroke];
    
    for (int i = 0; i < 100; i++) {
        //NSNumber *integer = [[NSNumber alloc] init];
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        PolygonShape *shape = [[PolygonShape alloc] init];
        shape.minimumNumberOfSides = 4;
        shape.maximumNumberOfSides = 10;
        shape.numberOfSides = 6;
        [array addObject: shape];
    }
    CGContextDrawPath (context, kCGPathFillStroke);
}

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides {
    CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
    float radius = 0.9 * center.x;
    NSMutableArray *result = [NSMutableArray array];
    float angle = (2.0 * M_PI) / numberOfSides;
    float exteriorAngle = M_PI - angle;
    float rotationDelta = angle - (0.5 * exteriorAngle);
    for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) {
        float newAngle = (angle * currentAngle) - rotationDelta; 
        float curX = cos(newAngle) * radius;
        float curY = sin(newAngle) * radius;
        [result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, center.y + curY)]];
    }
    
    return result;
}

@end
