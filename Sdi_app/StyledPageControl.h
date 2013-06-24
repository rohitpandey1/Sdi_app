//
//  StyledPageControl.h
//  Sdi_app
//
//  Created by Rohit on 10/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    PageControlStyleDefault = 0,
    PageControlStyleStrokedCircle = 1,
    PageControlStylePressed1 = 2,
    PageControlStylePressed2 = 3,
    PageControlStyleWithPageNumber = 4,
    PageControlStyleThumb = 5,
    PageControlStyleStrokedSquare = 6,
} PageControlStyle;

@interface StyledPageControl : UIControl

@property (nonatomic) UIColor *coreNormalColor, *coreSelectedColor;
@property (nonatomic) UIColor *strokeNormalColor, *strokeSelectedColor;
@property (nonatomic, assign) int currentPage, numberOfPages;
@property (nonatomic, assign) BOOL hidesForSinglePage;
@property (nonatomic, assign) PageControlStyle pageControlStyle;
@property (nonatomic, assign) int strokeWidth, diameter, gapWidth;
@property (nonatomic) UIImage *thumbImage, *selectedThumbImage;
@property (nonatomic) NSMutableDictionary *thumbImageForIndex, *selectedThumbImageForIndex;

- (void)setThumbImage:(UIImage *)aThumbImage forIndex:(NSInteger)index;
- (UIImage *)thumbImageForIndex:(NSInteger)index;
- (void)setSelectedThumbImage:(UIImage *)aSelectedThumbImage forIndex:(NSInteger)index;
- (UIImage *)selectedThumbImageForIndex:(NSInteger)index;

@end

