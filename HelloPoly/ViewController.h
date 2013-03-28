//
//  ViewController.h
//  HelloPoly
//
//  Created by dyzma on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PolygonShape;
@class PolyView;

@interface ViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *numberOfSides;
@property (nonatomic, retain) IBOutlet UILabel *polyName;
@property (nonatomic, retain) IBOutlet UIButton *increaseButton;
@property (nonatomic, retain) IBOutlet UIButton *decreaseButton;
@property (nonatomic, retain) PolygonShape *poly;
@property (retain, nonatomic) IBOutlet PolyView *polyView;
@property (nonatomic, retain) IBOutlet UISlider *slider;
@property (nonatomic, assign) CGPoint cgPointTouchBegin;
@property (nonatomic, assign) double currentAngle;

- (IBAction)increase:(id)sender;
- (IBAction)decrease:(id)sender;
- (IBAction)slide:(id)sender;

@end
