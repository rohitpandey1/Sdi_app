//
//  GRViewController.m
//  Sdi_app
//
//  Created by Rohit on 13/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import "GRViewController.h"

@interface GRViewController ()

@end

@implementation GRViewController

- (void)loadView
{
    [self setView:[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] ];
    
	// Create a patterned background
    UIImage *pattern = [UIImage imageNamed:@"background.jpg"];
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:pattern]];
    
	// -----------------------------
	// One finger, two taps
	// -----------------------------
    
	// Create gesture recognizer, notice the selector method
    UITapGestureRecognizer *oneFingerTwoTaps =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerTwoTaps)] ;
    
    // Set required taps and number of touches
    [oneFingerTwoTaps setNumberOfTapsRequired:2];
    [oneFingerTwoTaps setNumberOfTouchesRequired:1];
    
    // Add the gesture to the view
    [[self view] addGestureRecognizer:oneFingerTwoTaps];
    
	// -----------------------------
    // Two fingers, two taps
    // -----------------------------
    UITapGestureRecognizer *twoFingersTwoTaps =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingersTwoTaps)] ;
    [twoFingersTwoTaps setNumberOfTapsRequired:2];
    [twoFingersTwoTaps setNumberOfTouchesRequired:2];
    [[self view] addGestureRecognizer:twoFingersTwoTaps];
    
	// -----------------------------
    // One finger, swipe up
	// -----------------------------
    UISwipeGestureRecognizer *oneFingerSwipeUp =
  	[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeUp:)] ;
    [oneFingerSwipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [[self view] addGestureRecognizer:oneFingerSwipeUp];
    
	// -----------------------------
	// One finger, swipe down
	// -----------------------------
    UISwipeGestureRecognizer *oneFingerSwipeDown =
  	[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeDown:)] ;
    [oneFingerSwipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [[self view] addGestureRecognizer:oneFingerSwipeDown];
    
	// -----------------------------
	// Two finger rotate
	// -----------------------------
	UIRotationGestureRecognizer *twoFingersRotate =
  	[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingersRotate:)] ;
    [[self view] addGestureRecognizer:twoFingersRotate];
    
	// -----------------------------
	// Two finger pinch
	// -----------------------------
	UIPinchGestureRecognizer *twoFingerPinch =
  	[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerPinch:)] ;
    [[self view] addGestureRecognizer:twoFingerPinch];
    
}

/*--------------------------------------------------------------
 * One finger, two taps
 *-------------------------------------------------------------*/
- (void)oneFingerTwoTaps
{
	NSLog(@"Action: One finger, two taps");
}

/*--------------------------------------------------------------
 * Two fingers, two taps
 *-------------------------------------------------------------*/
- (void)twoFingersTwoTaps {
    NSLog(@"Action: Two fingers, two taps");
}

/*--------------------------------------------------------------
 * One finger, swipe up
 *-------------------------------------------------------------*/
- (void)oneFingerSwipeUp:(UISwipeGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer locationInView:[self view]];
    NSLog(@"Swipe up - start location: %f,%f", point.x, point.y);
}

/*--------------------------------------------------------------
 * One finger, swipe down
 *-------------------------------------------------------------*/
- (void)oneFingerSwipeDown:(UISwipeGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer locationInView:[self view]];
    NSLog(@"Swipe down - start location: %f,%f", point.x, point.y);
}

/*--------------------------------------------------------------
 * Two finger rotate
 *-------------------------------------------------------------*/
- (void)twoFingersRotate:(UIRotationGestureRecognizer *)recognizer
{
	// Convert the radian value to show the degree of rotation
	NSLog(@"Rotation in degrees since last change: %f", ([recognizer rotation] * 180) / M_PI);
}

/*--------------------------------------------------------------
 * Two finger pinch
 *-------------------------------------------------------------*/
- (void)twoFingerPinch:(UIPinchGestureRecognizer *)recognizer
{
	NSLog(@"Pinch scale: %f", recognizer.scale);
}



@end
