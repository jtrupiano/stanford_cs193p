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
	[self updateInterface:myPolygon.numberOfSides - 1];
}

- (IBAction)increase {
	[self updateInterface:myPolygon.numberOfSides + 1];
}

- (IBAction)sliderChanged:(id)sender {
	int value = [(UISlider*)sender value];
	[self updateInterface:value];
}

- (void)updateInterface:(int)sides {
	myPolygon.numberOfSides = sides;
	[slider setValue:sides];
	
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
	myPolygon.maximumNumberOfSides = 12;
	myPolygon.minimumNumberOfSides = 3;

	// set up slider
	[slider setContinuous: NO];
	[slider setMinimumValue: myPolygon.minimumNumberOfSides];
	[slider setMaximumValue: myPolygon.maximumNumberOfSides];
	
	[self updateInterface:sides];
}

@end
