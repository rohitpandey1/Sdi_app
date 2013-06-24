//
//  CustomePickerViewController.h
//  Sdi_app
//
//  Created by Rohit on 12/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomePickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
	IBOutlet	UIPickerView  *picker;
	IBOutlet	UILabel  *winner;
	IBOutlet	UIButton  *mbutton;
	
	NSArray *column1;
	NSArray *column2;
	NSArray *column3;
	NSArray *column4;
	NSArray *column5;
}

@property(nonatomic, retain) UIPickerView *picker;
@property(nonatomic, retain) NSArray *column1;
@property(nonatomic, retain) NSArray *column2;
@property(nonatomic, retain) NSArray *column3;
@property(nonatomic, retain) NSArray *column4;
@property(nonatomic, retain) NSArray *column5;
@property(nonatomic, retain) UILabel *winner;
@property(nonatomic, retain) UIButton *mbutton;

-(IBAction)rotate:(id)sender;

@end
