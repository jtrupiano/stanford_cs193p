//
//  PresenceAppDelegate.m
//  Presence
//
//  Created by John Trupiano on 9/2/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "PresenceAppDelegate.h"
#import "PersonListViewController.h"

@implementation PresenceAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    navController = [[UINavigationController alloc] init];
	
	PersonListViewController *controller = [[PersonListViewController alloc] initWithNibName:@"PersonListView" bundle:nil];
	[navController pushViewController:controller animated:YES];
	[controller release];
	
	[window addSubview:navController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[navController release];
    [window release];
    [super dealloc];
}


@end
