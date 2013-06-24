//
//  iADViewController.h
//  Sdi_app
//
//  Created by Rohit on 12/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface iADViewController : UIViewController <ADBannerViewDelegate> {
    
	UITableView *tv;
	ADBannerView *bannerView;
}

@property (nonatomic, retain) IBOutlet UITableView *tv;
@property (nonatomic, retain) ADBannerView *bannerView;

@end
