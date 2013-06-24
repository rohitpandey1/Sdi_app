//
//  STViewController.m
//  Sdi_app
//
//  Created by Rohit on 04/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import "STViewController.h"

@interface STViewController ()

@end

@implementation STViewController

/*
 - (id)initWithStyle:(UITableViewStyle)style {
 // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 if (self = [super initWithStyle:style]) {
 }
 return self;
 }
 */

- (void)viewDidLoad
{
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"One", @"Two", @"Three", nil];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentControl.frame = CGRectMake(35, 200, 250, 50);
    segmentControl.segmentedControlStyle = UISegmentedControlStylePlain;
    segmentControl.selectedSegmentIndex = 0;
    
    
	//UISegmentedControl *segmentControl = self.navigationItem.titleView;
    [segmentControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	selectedSegment = [segmentControl selectedSegmentIndex];
	self.navigationItem.titleView = segmentControl;
	
	//[segmentControl release];
	[super viewDidLoad];
}

-(void)segmentAction:(id)sender
{
	UISegmentedControl *segmentControl = sender;
	selectedSegment = [segmentControl selectedSegmentIndex];
	[self.tableView reloadData];
	
	//[segmentControl release];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] ;
    }
    // Configure the cell
	
	cell.text = [NSString stringWithFormat:@"I AM CELL %d", (selectedSegment * indexPath.row)];
	
    return cell;
}

/*
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 }
 */

/*
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 }
 if (editingStyle == UITableViewCellEditingStyleInsert) {
 }
 }
 */

/*
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */


/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 }
 */
/*
 - (void)didReceiveMemoryWarning {
 [super didReceiveMemoryWarning];
 }
 */

//- (void)dealloc {
//    [super dealloc];
//}
//

@end

