//
//  PersonListViewController.m
//  Presence
//
//  Created by John Trupiano on 9/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonListViewController.h"
#import "PersonViewController.h"

@implementation PersonListViewController

- (void)dealloc {
	[person1 release];
	[person2 release];
	[super dealloc];
}

- (void)viewDidLoad {	
	person1 = [[Person alloc] initWithValues:@"John" status:@"Omnipresent" image:@"avatar.jpg"];
	person2 = [[Person alloc] initWithValues:@"John's Clone" status:@"Whatever John is doing" image:@"avatar.jpg"];
	
	UIImage *my_image1 = [UIImage imageNamed:person1.imageReference];
	label1.text = person1.name;
	image1.image = my_image1;
	[image1 release];
	
	UIImage *my_image2 = [UIImage imageNamed:person2.imageReference];
	label2.text = person2.name;
	image2.image = my_image2;
	[image2 release];
}

- (void)button1Click {
	[self pushPersonView:person1];
}

- (void)button2Click {
	[self pushPersonView:person2];
}

- (void)pushPersonView:(Person *)person {
	NSLog(@"Loading controller for %@", person.name);
	PersonViewController *pview = [[PersonViewController alloc] initWithPerson:person];

	pview.title = [NSString stringWithFormat:@"%@'s details", person.name];
		
	[self.navigationController pushViewController:pview animated:YES];
}

@end
