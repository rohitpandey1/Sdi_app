//
//  TextView_ApplicationViewController.h
//  Sdi_app
//
//  Created by Rohit on 13/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TextView_ApplicationViewController : UIViewController  <UITextViewDelegate>
{
    UITextView *textView;
}

@property (nonatomic, retain) UITextView *textView;

@end


