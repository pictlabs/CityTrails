//
//  CTHomeScreenCollectionViewController.m
//  CityTrails
//
//  Created by Richard Geier on 6/29/12.
//  Copyright (c) 2012 Pict Labs. All rights reserved.
//

#import "CTHomeScreenCollectionViewController.h"

@interface CTHomeScreenCollectionViewController ()

@end

@implementation CTHomeScreenCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.collectionView registerClass:[CTHomeScreenCollectionViewCell class] forCellWithReuseIdentifier:@"MY_CELL"];
    
    UINavigationItem *navTile = [self navigationItem];
    
    [navTile setTitle:@"City Trails"];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Item Tapped");
    CTRegionTourListTableViewController *regionTourListTableViewController = [[CTRegionTourListTableViewController alloc] init];
    
    //Push the view onto the navigation controller
    [[self navigationController] pushViewController:regionTourListTableViewController animated:YES];
    
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CTHomeScreenCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"MY_CELL" forIndexPath:indexPath];
    
    cell.label.text = @"City Trails";
    
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
