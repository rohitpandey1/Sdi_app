//
//  PageControlDemoTableViewCell.m
//  Sdi_app
//
//  Created by Rohit on 10/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import "PageControlDemoTableViewCell.h"

@implementation PageControlDemoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _pageControl = [[StyledPageControl alloc] initWithFrame:CGRectZero];
        [_pageControl setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [self.contentView addSubview:_pageControl];
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.pageControl setFrame:CGRectMake(20,(self.frame.size.height-20)/2,self.frame.size.width-40,20)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end

