//
//  CTAppDelegate.h
//  CityTrails
//
//  Created by Richard Geier & Matt Willis on 6/26/12.
//  Copyright (c) 2012 Pict Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic) NSString *activeRegion;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
