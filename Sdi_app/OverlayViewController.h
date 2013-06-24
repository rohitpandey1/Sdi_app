//
//  OverlayViewController.h
//  Sdi_app
//
//  Created by Rohit on 04/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootViewController;

@interface OverlayViewController : UIViewController {
    
	RootViewController *rvController;
}

@property (nonatomic, retain) RootViewController *rvController;

@end
