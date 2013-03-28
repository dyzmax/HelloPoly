//
//  GraphComp.h
//  HelloPoly
//
//  Created by dyzma on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphComp : NSObject

+ (double) vectorAngle: (CGPoint) a b: (CGPoint) b;
+ (CGPoint) translate: (CGPoint) sourceVector translationVector: (CGPoint) translation;

@end
