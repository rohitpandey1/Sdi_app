//
//  DetailViewController1.h
//  Sdi_app
//
//  Created by Rohit on 12/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController1 : UIViewController {
    
	UILabel *textLabel;
	NSUInteger item;
}

@property (nonatomic, retain) IBOutlet UILabel *textLabel;
@property (nonatomic, assign) NSUInteger item;
@end
