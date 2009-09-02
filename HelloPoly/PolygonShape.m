//
//  PolygonShape.m
//  stanford
//
//  Created by John Trupiano on 8/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

- (id)init {
	return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
	NSLog(@"I am a Polygon being instantiated");
	if (self = [super init]) {
		[self setMinimumNumberOfSides:min];
		[self setMaximumNumberOfSides:max];
		[self setNumberOfSides:sides];
	}
	return self;
}

- (void)dealloc {
	NSLog(@"My poor empty dealloc method is being called.");
	[super dealloc];
}

- (void)setNumberOfSides:(int)value {
	if (value < minimumNumberOfSides) {
		NSLog(@"Invalid number of sides: %d is less than the minimum value of %d allowed", value, minimumNumberOfSides);
	}
	else if (value > maximumNumberOfSides) {
		NSLog(@"Invalid number of sides: %d is greater than the maximum value of %d allowed", value, maximumNumberOfSides);
	}
	else {
		numberOfSides = value;
	}
}

- (void)setMinimumNumberOfSides:(int)value {
	if (value <= 2) {
		NSLog(@"Invalid number of sides: %d is less than the minimum value of 2 allowed", value);
	}
	else {
		minimumNumberOfSides = value;
	}
}

- (void)setMaximumNumberOfSides:(int)value {
	if (value > 12) {
		NSLog(@"Invalid number of sides: %d is greater than the maximum value of 12 allowed", value);
	}
	else {
		maximumNumberOfSides = value;
	}
}

- (float)angleInDegrees {
	return (float)(180 * (numberOfSides - 2)) / numberOfSides;
}

- (float)angleInRadians {
	return [self angleInDegrees] * (M_PI / 180.0);
}

- (NSString*)name {
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						 @"Triangle", [NSNumber numberWithInt:3],
						 @"Quadrilateral", [NSNumber numberWithInt:4],
						 @"Pentagon", [NSNumber numberWithInt:5],
						 @"Hexagon", [NSNumber numberWithInt:6],
						 @"Heptagon", [NSNumber numberWithInt:7],
						 @"Octagon", [NSNumber numberWithInt:8],
						 @"Nonagon", [NSNumber numberWithInt:9],
						 @"Decagon", [NSNumber numberWithInt:10],
						 @"Hendecagon", [NSNumber numberWithInt:11],
						 @"Dodecagon", [NSNumber numberWithInt:12],
						 nil];
	return [dict objectForKey:[NSNumber numberWithInt:numberOfSides]];
}

- (NSString*)description {
	return [NSString stringWithFormat: @"Hello, I am a %d-sided polygon (aka a %@) with angles of %f degrees (%f radians).", numberOfSides, [self name], [self angleInDegrees], [self angleInRadians]];
}
@end
