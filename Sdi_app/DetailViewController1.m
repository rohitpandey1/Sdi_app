//
//  DetailViewController1.m
//  Sdi_app
//
//  Created by Rohit on 12/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import "DetailViewController1.h"

@interface DetailViewController1 ()

@end

@implementation DetailViewController1
@synthesize textLabel, item;

#pragma mark -
#pragma mark === Initialization and shutdown ===
#pragma mark -

- (void)viewDidLoad {
	
	textLabel.text = [NSString stringWithFormat:@"Item %d", item];
}

- (void)viewDidUnload {
    [super viewDidUnload];
	self.textLabel = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

@end