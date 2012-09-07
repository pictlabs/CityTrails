//
//  CTHomeScreenCollectionViewFlowLayout.m
//  CityTrails
//
//  Created by Richard Geier on 6/29/12.
//  Copyright (c) 2012 Pict Labs. All rights reserved.
//

#import "CTHomeScreenCollectionViewFlowLayout.h"

#define ITEM_SIZE 145.0

@implementation CTHomeScreenCollectionViewFlowLayout

-(id)init
{
    self = [super init];
    if (self) {
        
        //self.itemSize = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
        //self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsMake(5.0, 0.0, 0.0, 0.0);
        self.minimumInteritemSpacing = 5.0;
        self.minimumLineSpacing = 5.0;
    }
    return self;
}

-(void)applyCustomizationToLayoutAttributes:(UICollectionViewLayoutAttributes*)layoutAttributes
{
    //Customize layoutAttributes here
  
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray* allAttributesInRect = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes* cellAttributes in allAttributesInRect)
    {
        [self applyCustomizationToLayoutAttributes:cellAttributes];
    }


    return allAttributesInRect;
}

-(UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes* attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    
    
    return attributes;
}


@end
