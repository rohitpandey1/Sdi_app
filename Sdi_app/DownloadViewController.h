//
//  DownloadViewController.h
//  Sdi_app
//
//  Created by Rohit on 06/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIDownloadBar.h"
@interface DownloadViewController : UIViewController <UIDownloadBarDelegate>
{
    UIDownloadBar *bar;
//    UIProgressView *totalProgress;
//    int count;
//    
//    int totalCount;
//    int currentCount;
//    NSArray *_urlArray;
//    
//    int x;
//    int y;
//    int width;
//    int height;
//    UILabel *currentLabel;
//    UILabel *totalLabel;
//    
//    //download start cancel button
//    UIButton *button;
//    BOOL toggle;
}

//- (id)init:(NSArray*)urlArray;
//- (void) onClickButton : (id) sender;
//- (void) downNextStart;
//- (void) reloadBottomButton;
//@property (nonatomic, strong) UIDownloadBar *bar;
//@property (nonatomic, strong) UIProgressView *totalProgress;
//@property (nonatomic, strong) NSArray *_urlArray;
//@property (nonatomic, strong) UILabel *currentLabel;
//@property (nonatomic, strong) UILabel *totalLabel;

@end
