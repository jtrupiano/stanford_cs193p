#import "Controller.h"

@implementation Controller

- (void)dealloc {
	[myPolygon release];
	[super dealloc];
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
}

- (void)awakeFromNib {
	myPolygon = [[PolygonShape alloc] initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:12];
	[myPolygon retain];

	[self updateInterface];	
}

@end
