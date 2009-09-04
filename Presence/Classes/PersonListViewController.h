//
//  PersonListViewController.h
//  Presence
//
//  Created by John Trupiano on 9/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonListViewController : UIViewController {
	IBOutlet UIImageView *image1;
	IBOutlet UILabel     *label1;
	IBOutlet UIButton    *button1;
	
	IBOutlet UIImageView *image2;
	IBOutlet UILabel     *label2;
	IBOutlet UIButton    *button2;
	
	Person *person1;
	Person *person2;
}

- (IBAction) button1Click;
- (IBAction) button2Click;

- (void)pushPersonView:(Person*)person;

@end
