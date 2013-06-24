//
//  SMSSendViewController.h
//  Sdi_app
//
//  Created by Rohit on 04/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMessageComposeViewController.h>

@interface SMSSendViewController : UIViewController <MFMessageComposeViewControllerDelegate> {
	
	UILabel *SMS;
}

@property (nonatomic,retain) UILabel *SMS;

-(void)ComposerSheet;

@end

