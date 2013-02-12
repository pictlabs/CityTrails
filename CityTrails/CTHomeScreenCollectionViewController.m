//
//  CTHomeScreenCollectionViewController.m
//  CityTrails
//
//  Created by Richard Geier on 6/29/12.
//  Copyright (c) 2012 Pict Labs. All rights reserved.
//

#import "CTHomeScreenCollectionViewController.h"
#import "CTAppDelegate.h"

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

    CTRegionTourListTableViewController *regionTourListTableViewController = [[CTRegionTourListTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    [regionTourListTableViewController setManagedObjectContext:self.managedObjectContext];
    
    //Push the view onto the navigation controller
    [[self navigationController] pushViewController:regionTourListTableViewController animated:YES];
    
    NSManagedObject *region =  [Regions objectAtIndex:indexPath.row];
    
    CTAppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    mainDelegate.activeRegion = [region valueForKey:@"regionTitle"];
    
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
      cell.label2.text = [region valueForKey:@"regionTitle"];
    //cell.title = [region valueForKey:@"regionTitle"];
    
   if ([cell.label.text isEqualToString: @"Over-the-Rhine"])
   {cell.imageV.image = [UIImage imageNamed:@"OTR.jpeg"];
       cell.imageV2.image = [UIImage imageNamed:@"OTR.jpeg"];
   }

    else if ([cell.label.text isEqualToString: @"Clifton"])
    {cell.imageV.image = [UIImage imageNamed:@"Clifton.jpeg"];
        cell.imageV2.image = [UIImage imageNamed:@"Clifton.jpeg"];
    }
    
    else if ([cell.label.text isEqualToString: @"Newport"])
    {cell.imageV.image = [UIImage imageNamed:@"Newport.jpeg"];
        cell.imageV2.image = [UIImage imageNamed:@"Newport.jpeg"];
    }
    
    else if ([cell.label.text isEqualToString: @"Downtown Cincinnati"])
    {cell.imageV.image = [UIImage imageNamed:@"Cincinnati.jpeg"];
        cell.imageV2.image = [UIImage imageNamed:@"Cincinnati.jpeg"];
    }
    
    else
        cell.imageV.image = [UIImage imageNamed:@"Icon.png"];

    
    /* Leaving this here for when I figure out how to key off the row in the database
     switch (int j)
    {
        case 1:
        {
          cell.imageV.image = [UIImage imageNamed:@"OTR.jpeg"];
        }
        case 2:
        {
           cell.imageV.image = [UIImage imageNamed:@"Clifton.jpeg"];
        }
        default:
        {
           cell.imageV.image = [UIImage imageNamed:@"Icon.png"];
        }
    } */
    
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

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
    
   //reload all sections of the collectionView with the proper sized cells when the orientation changes
    
    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //use the bounds.size.width and bounds.size.height of the collectionView to make the cells. Subtracting 5 and 10 from these values as these are the insets & interim/line spacing declared in cthomescreencollectionviewflowlayout.m
        
    CGSize size = CGSizeMake((collectionView.bounds.size.width - 5)/2, (collectionView.bounds.size.height - 10)/2);
    
    return size;
    
}


//bug fix so that when we come back from regiontourlisttableviewcontroller, the collectionview reloads with the proper cell height/width

- (void) viewWillAppear:(BOOL)animated
{
    //[super viewWillAppear: animated];
    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
    
}

@end
