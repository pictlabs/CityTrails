//
//  CTHomeScreenCollectionViewCell.m
//  CityTrails
//
//  Created by Richard Geier on 6/29/12.
//  Copyright (c) 2012 Pict Labs. All rights reserved.
//

#import "CTHomeScreenCollectionViewCell.h" 
#import "QuartzCore/QuartzCore.h"

@implementation CTHomeScreenCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //this is the unselected backgroundView
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        
        imageView.backgroundColor = [UIColor darkGrayColor];
        imageView.clipsToBounds = YES;
        self.backgroundView = imageView;
        _imageV = imageView;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, 20.0)];
        label.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin;
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont boldSystemFontOfSize:14.0];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = [UIColor blackColor];
        label.alpha = .50;
        
        //label.text = @"City Trails";
        [imageView addSubview:label];
        _label = label;
         
    
        
        //this is the selected backgroundView, with a lightGrayColor
        UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        //imageView2.image = [UIImage imageNamed:@"Icon.png"];
        //imageView2.backgroundColor = [UIColor lightGrayColor];
        imageView2.clipsToBounds = YES;
        self.selectedBackgroundView = imageView2;
         _imageV2 = imageView2;
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, 20.0)];
        label2.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin;
        label2.textAlignment = NSTextAlignmentLeft;
        label2.font = [UIFont boldSystemFontOfSize:14.0];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = [UIColor blackColor];
        label.alpha = .50;

        
        //label.text = @"City Trails";
        [imageView2 addSubview:label2];
        _label2 = label2;
        
        
        //self.contentView.layer.borderWidth = 1.0f;
        
        self.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
