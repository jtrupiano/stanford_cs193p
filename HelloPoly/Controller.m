#import "Controller.h"

@implementation Controller

- (void)dealloc {
	[myPolygon release];
	[super dealloc];
}

- (PolygonView*)polygonView {
	return polygonView;
}

- (IBAction)decrease {
	myPolygon.numberOfSides -= 1;
	[self updateInterface];
}

- (IBAction)increase {
	myPolygon.numberOfSides += 1;
	[self updateInterface];
}

- (void)updateInterface {
	NSLog(@"Updating UI, my polygon is: %@", myPolygon);

	numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", myPolygon.numberOfSides];
	increaseButton.enabled = myPolygon.numberOfSides < myPolygon.maximumNumberOfSides ? YES : NO;
	decreaseButton.enabled = myPolygon.numberOfSides > myPolygon.minimumNumberOfSides ? YES : NO;
	
	[polygonView setNeedsDisplay];
	
	[self updateUserPreferences];
}

- (void)updateUserPreferences {
	NSLog(@"Saving the number of polygon sides as %d", myPolygon.numberOfSides);
	[[NSUserDefaults standardUserDefaults] setInteger:myPolygon.numberOfSides forKey:@"polygonSides"];
}

- (void)awakeFromNib {
	int sides = [[NSUserDefaults standardUserDefaults] integerForKey:@"polygonSides"];
	if (sides) {
		NSLog(@"Restoring sides from NSUserDefaults: %d", sides);
	} else {
		sides = 5;
		NSLog(@"Can't find sides from NSUserDefaults");
	}
	myPolygon.numberOfSides = sides;
	myPolygon.maximumNumberOfSides = 12;
	myPolygon.minimumNumberOfSides = 3;

	[self updateInterface];
}

@end
