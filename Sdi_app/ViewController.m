//
//  ViewController.m
//  Sdi_app
//
//  Created by Rohit on 04/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
#define CASE(str)      if ([__s__ isEqualToString:(str)])
#define SWITCH(s)      for (NSString *__s__ = (s); ; )
#define DEFAULT

#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    more_array = [[NSMutableArray alloc] init];
    [more_array addObject:@"Scroller"];
    [more_array addObject:@"Slider"];
    [more_array addObject:@"Email"];
    [more_array addObject:@"SMS"];
    [more_array addObject:@"MAP"];
    
    [more_array addObject:@"Segment_control"];
    [more_array addObject:@"Search_bar"];
    [more_array addObject:@"Text_View"];
    [more_array addObject:@"Switch"];
    [more_array addObject:@"Activity_Indicator"];
    
    [more_array addObject:@"Progress view"];
    [more_array addObject:@"Page_Control"];
    [more_array addObject:@"Stepper"];
    [more_array addObject:@"Image_view"];
    [more_array addObject:@"Web_View"];
    
//    [more_array addObject:@"Map_view"];
//    [more_array addObject:@"Scroll_view"];
    [more_array addObject:@"Picker_View"];
    [more_array addObject:@"Ad_Banner_View"];
    [more_array addObject:@"Tap_Gesture_Recognizer"];
    
    [more_array addObject:@"Tab_Bar_view"];
 
    
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
    return TableRow_COUNT;
    
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
    
    NSInteger section = [indexPath row];
           
    switch (section) {
        case Scroller: {
            ScrollerViewController *setting = [[ScrollerViewController alloc] initWithNibName:@"ScrollerViewController" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case Slider: {
            SampleViewController *setting = [[SampleViewController alloc] initWithNibName:@"SampleViewController" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case Email: {
            MailViewController *setting = [[MailViewController alloc] initWithNibName:@"MailViewController" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case SMS: {
            SMSSendViewController *setting = [[SMSSendViewController alloc] initWithNibName:@"SMSSendViewController" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case MAP: {
            MapViewController *setting = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case Segment_control: {
            STViewController *setting = [[STViewController alloc] initWithNibName:@"STViewController" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case Search_bar: {
            SViewController *setting = [[SViewController alloc] initWithNibName:@"SViewController" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case Activity_Indicator: {
            AIViewController *setting = [[AIViewController alloc] initWithNibName:@"AIViewController" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case Progress_view: {
            DownloadViewController *setting = [[DownloadViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case Stepper: {
            StepperViewController *setting = [[StepperViewController alloc] initWithNibName:@"StepperViewController" bundle:nil];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case Page_Control:{
            PageControlDemoListViewController *setting = [[PageControlDemoListViewController alloc] init];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case Picker_View:{
            CustomePickerViewController *setting = [[CustomePickerViewController alloc] initWithNibName:@"CustomePickerViewController" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case Web_View:{
            WebViewController *setting = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case Image_view:{
            ELCImagePickerDemoViewController *setting = [[ELCImagePickerDemoViewController alloc] initWithNibName:@"ELCImagePickerDemoViewController" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case Ad_Banner_View:{
            iADViewController *setting = [[iADViewController alloc] initWithNibName:@"iADViewController" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case Tap_Gesture_Recognizer:{
            GRViewController *setting = [[GRViewController alloc] init];
            [self.navigationController pushViewController:setting animated:YES];
            break;
        }
        case Text_View:{
            TextView_ApplicationViewController *setting = [[TextView_ApplicationViewController alloc] initWithNibName:@"TextView_ApplicationViewController" bundle:[NSBundle mainBundle]];

            [self.navigationController pushViewController:setting animated:YES];
            break;
        }

        default: {
            NSString *mess = @"No Implementation";            
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert!" message:[NSString stringWithFormat:@"%@",mess] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
            [alert show];
            break;
        }
    }
}

@end
