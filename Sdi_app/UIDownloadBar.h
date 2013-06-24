//
//  UIDownloadBar.h
//  Sdi_app
//
//  Created by Rohit on 06/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIProgressView;
@protocol UIDownloadBarDelegate;

@interface UIDownloadBar : UIProgressView {
    NSURLRequest        *DownloadRequest;
    NSURLConnection     *DownloadConnection;
    NSMutableData       *receivedData;
    NSString            *localFilename;
    NSURL               *downloadUrl;
    id<UIDownloadBarDelegate> __unsafe_unretained delegate;
    float               bytesReceived;
    long long           expectedBytes;
    
    BOOL                operationFinished, operationFailed, operationBreaked;
    BOOL                operationIsOK;
    BOOL                appendIfExist;
    FILE                *downFile;
    //NSString          *fileUrlPath;
    NSString            *possibleFilename;
    
    id obj;
    NSInteger _timeout;
    
    
    NSFileHandle *handle;
    
}

- (UIDownloadBar *)initWithURL:(NSURL *)fileURL progressBarFrame:(CGRect)frame timeout:(NSInteger)timeout delegate:(id<UIDownloadBarDelegate>)theDelegate;
- (void) restartUrl:(NSURL *)fileURL;

@property (assign) BOOL operationIsOK;
@property (assign) BOOL appendIfExist;
//@property (nonatomic, copy) NSString *fileUrlPath;

@property (nonatomic, strong)NSString           *localFilename;
@property (nonatomic, strong)NSURL              *downloadUrl;

@property (nonatomic, readonly, strong) NSMutableData* receivedData;
@property (nonatomic, readonly, strong) NSURLRequest* DownloadRequest;
@property (nonatomic, readonly, strong) NSURLConnection* DownloadConnection;
@property (nonatomic, unsafe_unretained) id<UIDownloadBarDelegate> delegate;

@property (nonatomic, readonly) float percentComplete;
@property (nonatomic, strong) NSString *possibleFilename;
@property (nonatomic, strong) id obj;

@property (nonatomic, readonly) float   bytesReceived;
@property (nonatomic, readonly) long long expectedBytes;

@property (nonatomic, strong) NSFileHandle *handle;


- (void) forceStop;

- (void) forceContinue;

- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL;
@end


@protocol UIDownloadBarDelegate<NSObject>

@optional
- (void)downloadBar:(UIDownloadBar *)downloadBar didFinishWithData:(NSData *)fileData suggestedFilename:(NSString *)filename;
- (void)downloadBar:(UIDownloadBar *)downloadBar didFailWithError:(NSError *)error;
- (void)downloadBarUpdated:(UIDownloadBar *)downloadBar;

@end