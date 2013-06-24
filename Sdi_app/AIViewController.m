//
//  AIViewController.m
//  Sdi_app
//
//  Created by Rohit on 06/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import "AIViewController.h"

@interface AIViewController ()

@end

@implementation AIViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] ;
	activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
	activityIndicator.center = self.view.center;
	[self.view addSubview: activityIndicator];
	
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	// This line starts the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	// This line starts the activity indicator on the view, in this case the table view
	[activityIndicator startAnimating];
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
	// Configure the cell.
	if (indexPath.row == 0)
	{
		cell.textLabel.text = @"Stop Animation";
	}
	else
	{
		cell.textLabel.text = @"Start Animation";
        
	}
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row == 0)
	{
		// This line stops the activity indicator in the status bar
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		
		// This line stops the activity indicator on the view, in this case the table view
		[activityIndicator stopAnimating];
	}
	else
	{
		// This line starts the activity indicator in the status bar
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
		// This line starts the activity indicator on the view, in this case the table view
		[activityIndicator startAnimating];
	}
}


//- (void)dealloc
//{
//    [super dealloc];
//}


@end

