//
//  CTViewControllerTemp.m
//  CityTrails
//
//  Created by Richard Geier on 7/3/12.
//  Copyright (c) 2012 Pict Labs. All rights reserved.
//

#import "CTViewControllerTemp.h"

@interface CTViewControllerTemp ()

@end

@implementation CTViewControllerTemp

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
