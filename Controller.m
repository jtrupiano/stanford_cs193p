#import "Controller.h"

@implementation Controller

- (void)dealloc {
	[myPolygon release];
	[super dealloc];
}

- (IBAction)decrease {
    NSLog(@"I am the decrease function");
}

- (IBAction)increase {
    NSLog(@"I am the increase function");    
}

- (void)awakeFromNib {
	myPolygon = [[PolygonShape alloc] init];
	[myPolygon setNumberOfSides: numberOfSidesLabel.text.integerValue];
	
	NSLog(@"My polygon is: %@", myPolygon);
}

@end
