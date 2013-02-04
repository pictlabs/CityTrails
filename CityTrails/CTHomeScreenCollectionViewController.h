//
//  CTHomeScreenCollectionViewController.h
//  CityTrails
//
//  Created by Richard Geier on 6/29/12.
//  Copyright (c) 2012 Pict Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTHomeScreenCollectionViewCell.h"
#import "CTRegionTourListTableViewController.h"

@interface CTHomeScreenCollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)  NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSArray *Regions;

@end

//test