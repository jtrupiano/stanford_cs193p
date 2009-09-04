//
//  PersonViewController.h
//  Presence
//
//  Created by John Trupiano on 9/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonViewController : UIViewController {
	IBOutlet UIImageView *imageView;
	IBOutlet UILabel *name;
	IBOutlet UILabel *status;
	
	Person *person;
}

@property (assign) Person *person;

-(id) initWithPerson:(Person*)a_person;

@end
