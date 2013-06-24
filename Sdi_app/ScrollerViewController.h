//
//  ScrollerViewController.h
//  Sdi_app
//
//  Created by Rohit on 04/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollViewWithPagingViewController.h"

@interface ScrollerViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UITableView *scrollerTable;
    NSMutableArray *more_array;
}

@end
