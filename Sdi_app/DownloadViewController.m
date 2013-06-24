//
//  DownloadViewController.m
//  Sdi_app
//
//  Created by Rohit on 06/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import "DownloadViewController.h"

@interface DownloadViewController ()

@end

@implementation DownloadViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    bar = [[UIDownloadBar alloc] initWithURL:[NSURL URLWithString:@"https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg"]
							progressBarFrame:CGRectMake(30, 100, 200, 20)
									 timeout:15
									delegate:self];
	
    [self.view setBackgroundColor:[UIColor grayColor]];
	[self.view addSubview:bar];
}

- (void)downloadBar:(UIDownloadBar *)downloadBar didFinishWithData:(NSData *)fileData suggestedFilename:(NSString *)filename {
	NSLog(@"Rohit...............");
    NSLog(@"%@", filename);
}

- (void)downloadBar:(UIDownloadBar *)downloadBar didFailWithError:(NSError *)error {
	NSLog(@"%@", error);
}

- (void)downloadBarUpdated:(UIDownloadBar *)downloadBar {}



/*
@synthesize bar,totalProgress,_urlArray,currentLabel,totalLabel;

- (id)init:(NSArray*)urlArray
{
    self = [super init];
    if (self) {
        // Custom initialization
        totalCount = [urlArray count];
        currentCount = 0;
        NSString *fileUrlPath = [urlArray objectAtIndex:0];
        
        x = 30;
        y = 337;
        width = 200;
        height = 20;
        
        bar = [[UIDownloadBar alloc] initWithURL:[NSURL URLWithString:fileUrlPath]
                                progressBarFrame:CGRectMake(x, y, width, height)
                                         timeout:15
                                        delegate:self];
        bar.center = CGPointMake(x+width/2, y);
        
        totalProgress = [[UIProgressView alloc]initWithFrame:CGRectMake(x, y+height, width, height)];
        totalProgress.center = CGPointMake(x+width/2, y+height);
        
        _urlArray = [urlArray mutableCopy];
        
    }
    count = 0;//9178
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    bar = [[UIDownloadBar alloc] initWithURL:[NSURL URLWithString:@"https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg"]
							progressBarFrame:CGRectMake(30, 100, 200, 20)
									 timeout:15
									delegate:self];
	
	[self.view addSubview:bar];

    
  //  [self init:nil];
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"bg_download.png"]]];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:bar];
    bar.obj = self;
    [bar forceStop];
    
    toggle = NO;
    {
        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"btn_down_iPad.png" ofType:nil]];
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *imageCancel = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"btn_cancel.png" ofType:nil]];
        button.frame = CGRectMake(0,0, imageCancel.size.width, imageCancel.size.height);
        button.center =  CGPointMake(320/2, 435);
        //        button.tag = 1;
        [button addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:image forState:UIControlStateNormal];
        //        [button setImage:image forState:UIControlStateHighlighted];
        [self.view addSubview:button];
    }
    //435
    //    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"btn_cancel.png" ofType:nil]];
    //    button = [UIButton buttonWithType:UIButtonTypeCustom];
    //    button.frame = CGRectMake(0,0, image.size.width, image.size.height);
    //    button.center = CGPointMake(320/2, 435);
    //    [button addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
    //    [button setImage:image forState:UIControlStateNormal];
    //    [button setImage:image forState:UIControlStateHighlighted];
    //    [self.view addSubview:button];
    
    [self.view addSubview:totalProgress];
    
    int labelWidth = 85;
    int margin = 10;
    currentLabel = [[UILabel alloc]initWithFrame:CGRectMake(x+width, y, labelWidth, height)];
    currentLabel.center = CGPointMake(x+width+labelWidth/2+margin, y);
    currentLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    //    label.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"time"];
    currentLabel.font = [UIFont systemFontOfSize:11.0f];
    //    [label setNumberOfLines:0];
    //    [label setLineBreakMode:UILineBreakModeWordWrap]; //길면 줄 바꿈됨
    currentLabel.text = [NSString stringWithFormat:@"%dMB/%dMB",(int)bar.bytesReceived/1000000 , (int)bar.expectedBytes/1000000];
    [currentLabel setNumberOfLines:0];
    [currentLabel setLineBreakMode:UILineBreakModeWordWrap];
    [self.view addSubview:currentLabel];
    //    currentLabel.backgroundColor = [UIColor redColor];
    currentLabel.backgroundColor = [UIColor clearColor];
    
    
    totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(x+width, y+height, labelWidth, height)];
    totalLabel.center = CGPointMake(x+width+labelWidth/2+margin, y+height);
    totalLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    //    label.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"time"];
    totalLabel.font = [UIFont systemFontOfSize:11.0f];
    //    [label setNumberOfLines:0];
    //    [label setLineBreakMode:UILineBreakModeWordWrap]; //길면 줄 바꿈됨
    totalLabel.text = [NSString stringWithFormat:@"%d / %d",currentCount,totalCount];
    [totalLabel setNumberOfLines:0];
    [totalLabel setLineBreakMode:UILineBreakModeWordWrap];
    [self.view addSubview:totalLabel];
    totalLabel.backgroundColor = [UIColor clearColor];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - iCloud 'do not backup' attribute
- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
{
    const char* filePath = [[URL path] fileSystemRepresentation];
    
    const char* attrName = "com.apple.MobileBackup";
    u_int8_t attrValue = 1;
    
    int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
    return result == 0;
}


#pragma mark - download delegate
- (void)downloadBar:(UIDownloadBar *)downloadBar didFinishWithData:(NSData *)fileData suggestedFilename:(NSString *)filename {
    NSLog(@"%@", filename);
    
    NSString *applicationDocumentsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    //    NSString *documentPath =                [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *pathURL= [NSURL fileURLWithPath:applicationDocumentsDir];
    [self addSkipBackupAttributeToItemAtURL:pathURL];
    
    
    //temp
    //    filename = @"TRASHENG_01_1_800k.mp4";
    
    NSString *storePath = [applicationDocumentsDir stringByAppendingPathComponent:filename];
    
    NSLog(@"File stored at location : %@", storePath);
    
    //read text;
    //    NSString *someString = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
    //    NSLog(@"%@",[NSString stringWithFormat:@"%@",someString]);
    
    
    
    currentCount ++;
    totalLabel.text = [NSString stringWithFormat:@"%d / %d",currentCount,totalCount];
    
    float percent = ((float)currentCount)/(float)totalCount;
    NSLog(@"percent : %f",percent);
    //    [totalProgress setProgress:percent animated:YES];
    [totalProgress setProgress:percent];
    
    
    // write to file atomically (using temp file)
    //    [fileData writeToFile:storePath atomically:TRUE];
    //    fileData = nil;
    
    
    if(1 < totalCount && currentCount < totalCount){
        //down next
        [self downNextStart];
    }else{
        //down over
        [self.view removeFromSuperview];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableView" object:nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadBottomALL" object:nil];
    }
    
    
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableView" object:nil];
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadBottomALL" object:nil];
}

- (void)downloadBar:(UIDownloadBar *)downloadBar didFailWithError:(NSError *)error {
    NSLog(@"%@", error);
    
    UIAlertView *resultView = [[UIAlertView alloc] initWithTitle:@"다운로드 실패"
                                                         message:@"통신상태가 좋지 않습니다. 다시 시도해주세요!"
                                                        delegate:self
                                               cancelButtonTitle:nil
                                               otherButtonTitles:@"확인", nil];
    [resultView show];
    
    [self.view removeFromSuperview];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableView" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadBottomALL" object:nil];
    
    
}

- (void)downloadBarUpdated:(UIDownloadBar *)downloadBar {
    //    count++;
    //    NSLog(@"%d",count);
    
    currentLabel.text = [NSString stringWithFormat:@"%dMB/%dMB",(int)bar.bytesReceived/1000000 , (int)bar.expectedBytes/1000000];
    
    NSLog(@" bar.bytesReceived %f", bar.bytesReceived);
    NSLog(@" bar.expectedBytes %f", (float)bar.expectedBytes);
}

- (void) onClickButton : (id) sender
{
    toggle = !toggle;
    
    if(toggle){
        //start
        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"btn_cancel.png" ofType:nil]];
        [button setImage:image forState:UIControlStateNormal];
        
        
        NSString *fileUrlPath = [_urlArray objectAtIndex:0];
        bar = [[UIDownloadBar alloc] initWithURL:[NSURL URLWithString:fileUrlPath]
                                progressBarFrame:CGRectMake(x, y, width, height)
                                         timeout:15
                                        delegate:self];
        bar.center = CGPointMake(x+width/2, y);
        [self.view addSubview:bar];
        bar.obj = self;
    }else{
        //stop
        
        [bar forceStop];
        [self.view removeFromSuperview];
        //        [self.view removeFromSuperview];
    }
    
    //    [bar forceStop];
    //    [self.view removeFromSuperview];
    //reloadTableView
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableView" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadBottomALL" object:nil];
}

- (void) downNextStart
{
    
    NSString *fileUrlPath = [_urlArray objectAtIndex:currentCount];
    [bar restartUrl:[NSURL URLWithString:fileUrlPath]];
}

- (void) reloadBottomButton
{
    
    [self.view removeFromSuperview];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableView" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadBottomALL" object:nil];
    
}
*/

@end
