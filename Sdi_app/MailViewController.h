//
//  MailViewController.h
//  Sdi_app
//
//  Created by Rohit on 04/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface MailViewController : UIViewController <MFMailComposeViewControllerDelegate>

- (IBAction)openMail:(id)sender;

@end
