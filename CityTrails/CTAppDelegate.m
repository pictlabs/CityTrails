//
//  CTAppDelegate.m
//  CityTrails
//
//  Created by Richard Geier & Matt Willis on 6/26/12.
//  Copyright (c) 2012 Pict Labs. All rights reserved.
//

#import "CTAppDelegate.h"
#import "CTHomeScreenCollectionViewController.h"
#import "CTHomeScreenCollectionViewFlowLayout.h"

@implementation CTAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    
    //Create and use the default init for our flowlayout subclass
     // Flow Layout can be cusotmized in its init routine local to its class
    CTHomeScreenCollectionViewFlowLayout *homeScreenCollectionViewFlowLayout = [[CTHomeScreenCollectionViewFlowLayout alloc] init];
    // Flow Layout can be cusotmized in its init routine
    
    // Create and init our CollectionviewController with the Flow layout object we created
    //This is basically all default behavior 
    CTHomeScreenCollectionViewController *homeScreenCollectionViewController = [[CTHomeScreenCollectionViewController alloc] initWithCollectionViewLayout:homeScreenCollectionViewFlowLayout];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:homeScreenCollectionViewController];

    //Set root view controller to our collectionviewcontroller that shows the collectionview cells
    //[[self window] setRootViewController:homeScreenCollectionViewController];
    
    // Set Nav Controller first
    [[self window] setRootViewController:navController];
    
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
