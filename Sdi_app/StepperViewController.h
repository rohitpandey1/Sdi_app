//
//  StepperViewController.h
//  Sdi_app
//
//  Created by Rohit on 06/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StepperViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIStepper *ourStepper;
@property (strong, nonatomic) IBOutlet UILabel *stepperValueLabel;
- (IBAction)stepperValueChanged:(id)sender;

@end
