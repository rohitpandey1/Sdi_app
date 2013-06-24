//
//  ViewController.h
//  Sdi_app
//
//  Created by Rohit on 04/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollerViewController.h"
#import "SampleViewController.h"
#import "MailViewController.h"
#import "SMSSendViewController.h"
#import "STViewController.h"
#import "MapViewController.h"
#import "SViewController.h"
#import "AIViewController.h"
#import "DownloadViewController.h"
#import "StepperViewController.h"
#import "PageControlDemoListViewController.h"
#import "CustomePickerViewController.h"
#import "WebViewController.h"
#import "ELCImagePickerDemoViewController.h"
#import "iADViewController.h"
#import "GRViewController.h"
#import "TextView_ApplicationViewController.h"

//enum for each functionality
//enum for each functionality
//enum for each functionality
typedef enum
{
	Scroller = 0,
	Slider,
	Email,
	SMS,
	MAP,
    
	Segment_control,
    Search_bar,
	Text_View,
	Switch,
	Activity_Indicator,
    
	Progress_view,
    Page_Control,
	Stepper,
	Image_view,
	Web_View,
    
//	Map_view,
//    Scroll_view,
	Picker_View,
	Ad_Banner_View,
	Tap_Gesture_Recognizer,
    
    Tab_Bar_view,
    
    TableRow_COUNT
    
}
iOS_Features;

//NSString * const kImageTypeArray[] = {
//    @"JPEG",
//    @"PNG",
//    @"GIF",
//    @"PowerVR"
//};

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *table;
    NSMutableArray *more_array;
}
@end

