//
//  iADViewController.m
//  Sdi_app
//
//  Created by Rohit on 12/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import "iADViewController.h"
#import "DetailViewController1.h"
//#import "Reachability.h"

@interface iADViewController (privatemethods)
- (void)createBannerView;
- (void)showBanner;
- (void)hideBanner;
- (void)releaseBanner;
- (void)changeBannerOrientation:(UIInterfaceOrientation)toOrientation;
- (BOOL)networkReachable;
@end

@implementation iADViewController

@synthesize tv, bannerView;

#pragma mark -
#pragma mark === Initialization and shutdown ===
#pragma mark -

- (void)viewDidLoad {
	
	// If the network is reachable create the iAd banner, otherwise we
	// wait until the network becomes reachable
//	BOOL reachable = [self networkReachable];
//	
//	if (reachable) {
//		[self createBannerView];
//	}
    
    [self createBannerView];
	
	// Listen for reachability changes
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(reachabilityChanged:)
//                                                 name:kReachabilityChangedNotification
//                                               object:nil];
}

- (void)viewDidUnload {
	
	[super viewDidUnload];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
	[self releaseBanner];
	self.tv = nil;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
	[self releaseBanner];
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
								duration:(NSTimeInterval)duration {
	
	if (bannerView) {
		[self changeBannerOrientation:toInterfaceOrientation];
	}
}

- (void)viewWillAppear:(BOOL)animated {
	
	NSIndexPath *indexPath = [self.tv indexPathForSelectedRow];
	
	if (indexPath) {
		[self.tv deselectRowAtIndexPath:indexPath animated:YES];
	}
	
	if (bannerView) {
		UIInterfaceOrientation orientation = self.interfaceOrientation;
		[self changeBannerOrientation:orientation];
	}
}

#pragma mark -
#pragma mark === Table View Methods ===
#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] ;
    }
    
	NSUInteger row = [indexPath row];
	cell.textLabel.text = [NSString stringWithFormat:@"Row %d", row];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSUInteger row = [indexPath row];
	
	DetailViewController1 *viewController = [[DetailViewController1 alloc] initWithNibName:@"DetailViewController1" bundle:nil];
	
	viewController.item = row;
	[[self navigationController] pushViewController:viewController animated:YES];
	
	
}

#pragma mark -
#pragma mark === Banner View Methods ===
#pragma mark -

- (void)createBannerView {
	
	Class cls = NSClassFromString(@"ADBannerView");
	if (cls) {
		ADBannerView *adView = [[cls alloc] initWithFrame:CGRectZero];
		adView.requiredContentSizeIdentifiers = [NSSet setWithObjects:ADBannerContentSizeIdentifier320x50,
												 ADBannerContentSizeIdentifier480x32, nil];
		
		// Set the current size based on device orientation
		adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
		adView.delegate = self;
		
		adView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
		
		// Set intital frame to be offscreen
		CGRect bannerFrame =adView.frame;
		bannerFrame.origin.y = - bannerFrame.size.height;
		adView.frame = bannerFrame;
		
		self.bannerView = adView;
		
		[self.view addSubview:adView];
		
	}
}

- (void)showBanner {
	
	CGFloat fullViewHeight = self.view.frame.size.height;
	CGRect tableFrame = self.tv.frame;
	CGRect bannerFrame = self.bannerView.frame;
	
	// Shrink the tableview to create space for banner
    tableFrame.size.height = fullViewHeight - bannerFrame.size.height;
	tableFrame.origin.y = bannerFrame.size.height;
	
	// Move banner onscreen
	bannerFrame.origin.y = 0;
	
	[UIView beginAnimations:@"showBanner" context:NULL];
	self.tv.frame = tableFrame;
	self.bannerView.frame = bannerFrame;
	[UIView commitAnimations];
}

- (void)hideBanner {
	
	// Grow the tableview to occupy space left by banner
	CGFloat fullViewHeight = self.view.frame.size.height;
	CGRect tableFrame = self.tv.frame;
    tableFrame.size.height = fullViewHeight;
	tableFrame.origin.y = 0;
	
	// Move the banner view offscreen
	CGRect bannerFrame = self.bannerView.frame;
	bannerFrame.origin.y = - bannerFrame.size.height;
	
	self.tv.frame = tableFrame;
	self.bannerView.frame = bannerFrame;
}

- (void)releaseBanner {
    
	if (self.bannerView) {
		bannerView.delegate = nil;
		self.bannerView = nil;
	}
}

- (void)changeBannerOrientation:(UIInterfaceOrientation)toOrientation {
	
	if (UIInterfaceOrientationIsLandscape(toOrientation)) {
		self.bannerView.currentContentSizeIdentifier =
		ADBannerContentSizeIdentifier480x32;
	}
	else {
		self.bannerView.currentContentSizeIdentifier =
		ADBannerContentSizeIdentifier320x50;
	}
}

#pragma mark -
#pragma mark === ADBannerViewDelegate Methods ===
#pragma mark -

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
	
	[self showBanner];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
	
	[self hideBanner];
}
/*
#pragma mark -
#pragma mark === Reachability Notification ===
#pragma mark -

- (void)reachabilityChanged:(NSNotification *)note {
	
	BOOL reachable = [self networkReachable];
	
	if (reachable && (self.bannerView == nil)) {
        [self createBannerView];
	}
	
	if (!reachable && self.bannerView) {
        [self hideBanner];
        [self releaseBanner];
    }
}

- (BOOL)networkReachable {
	
	TabnavAppDelegate *delegate = (TabnavAppDelegate *)[[UIApplication sharedApplication]
														delegate];
	Reachability *netReach = [delegate netReach];
	
	NetworkStatus netStatus = [netReach currentReachabilityStatus];
	BOOL connectionRequired = [netReach connectionRequired];
	
	if ((netStatus == ReachableViaWiFi) ||
		((netStatus == ReachableViaWWAN) && !connectionRequired)) {
		
		return YES;
	}
	
	return NO;
}
*/

@end
