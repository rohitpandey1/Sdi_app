//
//  CustomePickerViewController.m
//  Sdi_app
//
//  Created by Rohit on 12/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import "CustomePickerViewController.h"

@interface CustomePickerViewController ()

@end

@implementation CustomePickerViewController
@synthesize picker, column1, column2, column3, column4, column5, winner, mbutton;

-(void)showButton
{
	mbutton.hidden = NO;
}

-(void)youWon
{
	winner.text = @"Winner";
	[self performSelector:@selector(showButton) withObject:nil afterDelay:60.0];
}

-(IBAction)rotate:(id)sender
{
	BOOL win = NO;
	int numInRow = 1;
	int lastVal = -1;
	for (int i = 0; i < 5; i++)
	{
		int newValue = random() % [self.column1 count];
		if (newValue == lastVal)
			numInRow++;
		else
			numInRow = 1;
		lastVal = newValue;
		[picker selectRow:newValue inComponent:i animated:YES];
		[picker reloadComponent:i];
		if (numInRow >= 3)
			win = YES;
	}
	
	mbutton.hidden = YES;
	if (win)
		[self performSelector:@selector(youWon) withObject:nil afterDelay:0.5];
	else
		[self performSelector:@selector(showButton) withObject:nil afterDelay:0.5];
	winner.text = @"";
}

- (void)viewDidLoad
{
	UIImage *one = [UIImage imageNamed:@"one.jpg"];
	UIImage *two = [UIImage imageNamed:@"two.jpg"];
	UIImage *three = [UIImage imageNamed:@"three.jpg"];
	UIImage *four = [UIImage imageNamed:@"four.jpg"];
	UIImage *five = [UIImage imageNamed:@"five.jpg"];
	UIImage *six = [UIImage imageNamed:@"six.jpg"];
	UIImage *seven = [UIImage imageNamed:@"seven.jpg"];
	UIImage *nine  = [UIImage imageNamed:@"nine.jpg"];
    
    
	for (int i = 1; i <= 5; i++)
	{
		UIImageView *oneView = [[UIImageView alloc] initWithImage:one];
		UIImageView *twoView = [[UIImageView alloc] initWithImage:two];
		UIImageView *threeView = [[UIImageView alloc] initWithImage:three];
		UIImageView *fourView = [[UIImageView alloc] initWithImage:four];
		UIImageView *fiveView = [[UIImageView alloc] initWithImage:five];
		UIImageView *sixView = [[UIImageView alloc] initWithImage:six];
		UIImageView *sevenView = [[UIImageView alloc] initWithImage:seven];
		UIImageView *nineView = [[UIImageView alloc] initWithImage:nine];
        NSArray *imageViewArray = [[NSArray alloc] initWithObjects: oneView, twoView, threeView, fourView, fiveView, sixView, sevenView, nineView, nil];
		NSString *fieldName = [[NSString alloc] initWithFormat:@"column%d", i];
		[self setValue:imageViewArray forKey:fieldName];
		
		
	}
	// Seed the random number generator
	srandom(time(NULL));
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
		// Initialization code
	}
	return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
}


#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [self.column1 count];
}
#pragma mark Picker Delegate Methods

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
	if (component == 0)
		return [self.column1 objectAtIndex:row];
	else if (component == 1)
		return [self.column2 objectAtIndex:row];
	else if (component == 2)
		return [self.column3 objectAtIndex:row];
	else if (component == 3)
		return [self.column4 objectAtIndex:row];
	return [self.column5 objectAtIndex:row];
}
@end
