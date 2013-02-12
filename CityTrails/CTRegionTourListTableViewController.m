//
//  CTRegionTourListTableViewController.m
//  CityTrails
//
//  Created by Richard Geier on 6/30/12.
//  Copyright (c) 2012 Pict Labs. All rights reserved.
//

#import "CTRegionTourListTableViewController.h"
#import "QuartzCore/QuartzCore.h"
#import "CTAppDelegate.h"

@interface CTRegionTourListTableViewController ()

@end



@implementation CTRegionTourListTableViewController

@synthesize Attractions,managedObjectContext;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
   
    
    CGRect rect = CGRectMake(0.0 ,0.0, self.tableView.bounds.size.width, self.tableView.bounds.size.height);
     UIView *blackOverlay = [[UIView alloc] initWithFrame:rect];
     blackOverlay.alpha = 0.65;
     blackOverlay.backgroundColor = UIColor.blackColor;
     blackOverlay.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    blackOverlay.tag = 10;
     [self.tableView insertSubview:blackOverlay aboveSubview:self.tableView];
     

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(blackOverlay.bounds.size.width/4, blackOverlay.bounds.size.height-60, blackOverlay.bounds.size.width/2, 40.0)];
    button.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin;
    [button setTitle:@"Tap To Dismiss" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.layer.borderColor = [UIColor orangeColor].CGColor;
    button.layer.borderWidth = 1.0f;
    button.tag = 11;
    
    
    [blackOverlay addSubview:button];
    
    [button addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
        
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(IBAction)cancel:(id)sender {
    
    NSLog(@"Got here");
    
   [[self.tableView viewWithTag:10]removeFromSuperview];
    
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{

    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
// Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    CTAppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
     
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription  entityForName:@"Region" inManagedObjectContext:managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"regionTitle == %@",mainDelegate.activeRegion];
    [fetchRequest setPredicate:predicate];
    
    NSError *regionErrorFinal = nil;
    NSArray *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&regionErrorFinal];
    if (fetchedObjects == nil) {
        
    }else
    {
        NSManagedObject *region = fetchedObjects[0];
        NSLog(@"Fetched active region object: %@", region);
       
        NSFetchRequest *fetchRequest2 = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity2 = [NSEntityDescription  entityForName:@"Attraction" inManagedObjectContext:managedObjectContext];
        
        [fetchRequest2 setEntity:entity2];
        
        NSPredicate *predicate =[NSPredicate predicateWithFormat:@"region = %@",region];
        [fetchRequest2 setPredicate:predicate];
        
        NSError *regionErrorFinal = nil;
        NSArray *fetchedObjects2 = [managedObjectContext executeFetchRequest:fetchRequest2 error:&regionErrorFinal];
        if (fetchedObjects2 == nil) {
            
        }else
        {
            cell.textLabel.text = [fetchedObjects2[indexPath.section] valueForKey:@"attractionTitle"];
        }
        
        //.textLabel.text = [fetchedObjects[indexPath.section] ob:@"attractionTitle"];
    }
    
    
    /*
    // Configure the cell...

    NSInteger j = indexPath.section;

    if (j == 0) {
        cell.textLabel.text = mainDelegate.activeRegion;
        //cell.textLabel.text = @"Tour 1";
    }
    
    else if (j == 1){
        cell.textLabel.text = @"Tour 2";
    }
    
    else {
        cell.textLabel.text = @"Tour";
    }
    */
    
    //return the cell
    
    return cell;
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    CTDetailTourListViewController *detailViewController =[[CTDetailTourListViewController alloc] initWithStyle:UITableViewStyleGrouped];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
    
}

@end
