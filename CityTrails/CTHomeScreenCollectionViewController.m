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

@synthesize managedObjectContext, Regions;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.collectionView registerClass:[CTHomeScreenCollectionViewCell class] forCellWithReuseIdentifier:@"MY_CELL"];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Region" inManagedObjectContext:managedObjectContext];
    //NSEntityDescription *entity = [NSEntityDescription entityForName:@"Region" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    NSError *error;
    self.Regions = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
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
    return [Regions count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CTHomeScreenCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"MY_CELL" forIndexPath:indexPath];
    
    
    // Set up the cell...
    NSManagedObject *region =  [Regions objectAtIndex:indexPath.row];
    cell.label.text = [region valueForKey:@"regionTitle"];
    
    
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
