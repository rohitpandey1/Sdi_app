//
//  MapViewController.m
//  Sdi_app
//
//  Created by Rohit on 04/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    more_array = [[NSMutableArray alloc] init];
    [more_array addObject:@"map display"];
    [more_array addObject:@"map display & location"];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [more_array count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell=nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if ([more_array count]>0) {
        UILabel *nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(65, -2, 190, 50)];
        nameLbl.backgroundColor = [UIColor clearColor];
        nameLbl.textColor = [UIColor blackColor];
        nameLbl.text = [more_array objectAtIndex:indexPath.row];
        nameLbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
        nameLbl.numberOfLines=0;
        nameLbl.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:nameLbl];
    }
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        MapDisplayViewController *setting = [[MapDisplayViewController alloc] initWithNibName:@"MapDisplayViewController" bundle:[NSBundle mainBundle]];
        [self.navigationController pushViewController:setting animated:YES];
    }
    else{
        NSString *mess = @"No Implementation";
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert!" message:[NSString stringWithFormat:@"%@",mess] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
        [alert show];
    }
    
}

@end
