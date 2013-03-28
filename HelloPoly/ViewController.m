//
//  ViewController.m
//  HelloPoly
//
//  Created by dyzma on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "PolygonShape.h"
#import "PolyView.h"
#import "GraphComp.h"


@implementation ViewController

@synthesize numberOfSides, poly, increaseButton, decreaseButton, polyView, polyName, slider, cgPointTouchBegin, currentAngle;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];  
    NSNumber *numberOfSlides = [userDefaults objectForKey:@"numberOfSlides"];
    
    if (numberOfSlides == nil) {
        numberOfSlides = [NSNumber numberWithInt:4];
        [userDefaults setInteger:4 forKey:@"numberOfSlides"];
    }
    
    PolygonShape *_poly = [[PolygonShape alloc] initWithNumberOfSides:[numberOfSlides intValue] minimumNumberOfSides:3 maximumNumberOfSides:12];
    
    self.poly = _poly;
    self.polyView.poly = _poly;
    
    slider.maximumValue = _poly.maximumNumberOfSides - 1;
    slider.minimumValue = _poly.minimumNumberOfSides + 1;
    slider.value = _poly.numberOfSides;
        
    [_poly release];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) updateLabel {
    self.numberOfSides.text = [NSString stringWithFormat:@"%d", self.poly.numberOfSides];
    
    if (self.poly.numberOfSides == self.poly.maximumNumberOfSides - 1) {
        self.increaseButton.enabled = NO;
    } else {
        self.increaseButton.enabled = YES;
    }
    
    if (self.poly.numberOfSides == self.poly.minimumNumberOfSides + 1) {
        self.decreaseButton.enabled = NO;
    } else {
        self.decreaseButton.enabled = YES;
    }
    
    self.polyName.text = self.poly.name;
    [self.polyView setNeedsDisplay];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];  
    [userDefaults setInteger:self.poly.numberOfSides forKey:@"numberOfSlides"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self updateLabel];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)increase:(id)sender {
    self.poly.numberOfSides = self.poly.numberOfSides + 1;
    self.slider.value = self.poly.numberOfSides;
    [self updateLabel];
}

- (IBAction)decrease:(id)sender {
    self.poly.numberOfSides = self.poly.numberOfSides - 1;
    self.slider.value = self.poly.numberOfSides;
    [self updateLabel];
}

- (IBAction)slide:(id)sender {
    UISlider *_slider = (UISlider *) sender;
    self.poly.numberOfSides = round([_slider value]);
    [self updateLabel];
}

- (void)dealloc {
    [polyView release];
    [super dealloc];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        self.cgPointTouchBegin = [touch locationInView:self.view];
        break;
    }
}

- (CGPoint) getVectorFromTheCenterOfThePolyView : (CGPoint) location {
    CGPoint translationVector = CGPointMake(self.polyView.frame.origin.x + self.polyView.frame.size.width / 2.0, self.polyView.frame.origin.y + self.polyView.frame.size.height / 2.0);
    return [GraphComp translate:location translationVector: translationVector];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        [UIView beginAnimations:@"rotate" context:nil];
        [UIView setAnimationDuration:0];
        
        CGPoint vector = [self getVectorFromTheCenterOfThePolyView:[touch locationInView:self.view]];
        CGPoint previousVector = [self getVectorFromTheCenterOfThePolyView: self.cgPointTouchBegin];
        
        double angle = [GraphComp vectorAngle:vector b:previousVector];
        self.currentAngle = self.currentAngle + angle;
        
        self.polyView.transform = CGAffineTransformMakeRotation(self.currentAngle);
        
        self.cgPointTouchBegin = [touch locationInView:self.view];
        
        [UIView commitAnimations];
        
        break;
    }    
}

@end
