#import "Controller.h"

@implementation Controller

- (void)dealloc {
	[myPolygon release];
	[super dealloc];
}

- (IBAction)decrease {
    NSLog(@"I am the decrease function");
	int new_side_count = myPolygon.numberOfSides - 1;
	[self updatePolygon:new_side_count];
	[self updateInterface];
}

- (IBAction)increase {
    NSLog(@"I am the increase function");
	int new_side_count = myPolygon.numberOfSides + 1;
	[self updatePolygon:new_side_count];	
	[self updateInterface];
}

- (void)updateInterface {
	NSLog(@"Updating UI, my polygon is: %@", myPolygon);

	numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", myPolygon.numberOfSides];
	increaseButton.enabled = myPolygon.numberOfSides < myPolygon.maximumNumberOfSides ? YES : NO;
	decreaseButton.enabled = myPolygon.numberOfSides > myPolygon.minimumNumberOfSides ? YES : NO;
}

- (void)updatePolygon:(int)sides {
	[myPolygon release];
	myPolygon = [[PolygonShape alloc] init];
	[myPolygon retain];
	myPolygon.numberOfSides = sides;
}

- (void)awakeFromNib {
	myPolygon = [[PolygonShape alloc] init];
	[myPolygon retain];
	[myPolygon setNumberOfSides: numberOfSidesLabel.text.integerValue];

	[self updateInterface];	
}

@end
