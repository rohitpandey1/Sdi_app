//
//  DetailViewController.h
//  Sdi_app
//
//  Created by Rohit on 04/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController {
	
	IBOutlet UILabel *lblText;
	NSString *selectedCountry;
    
}

@property (nonatomic, retain) NSString *selectedCountry;

@end
