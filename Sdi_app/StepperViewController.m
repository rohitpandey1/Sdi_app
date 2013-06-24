//
//  StepperViewController.m
//  Sdi_app
//
//  Created by Rohit on 06/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import "StepperViewController.h"

@interface StepperViewController ()

@end

@implementation StepperViewController
@synthesize ourStepper;
@synthesize stepperValueLabel;

#pragma mark - Action Methods

- (IBAction)stepperValueChanged:(id)sender
{
    double stepperValue = ourStepper.value;
    self.stepperValueLabel.text = [NSString stringWithFormat:@"%.f", stepperValue];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ourStepper.minimumValue = 0;
    self.ourStepper.maximumValue = 1000;
    self.ourStepper.stepValue = 5;
    self.ourStepper.wraps = YES;
    self.ourStepper.autorepeat = YES;
    self.ourStepper.continuous = YES;
    self.stepperValueLabel.text = [NSString stringWithFormat:@"%.f", ourStepper.value];
}

- (void)viewDidUnload
{
    [self setOurStepper:nil];
    [self setStepperValueLabel:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
