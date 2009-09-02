#import "PolygonView.h"

@implementation PolygonView

- (void)drawRect:(CGRect)rect {
	NSLog(@"Drawing the PolygonView!  My polygon has %d sides.", [myPolygon numberOfSides]);

	[[UIColor grayColor] set];
	UIRectFill([self bounds]);
	
	NSArray *points = [PolygonView pointsForPolygonInRect:[self bounds] numberOfSides: myPolygon.numberOfSides];
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextBeginPath(context);

	NSLog(@"Number of points %d", [points count]);
	bool first_point = true;
	for (NSValue *val in points) {
		CGPoint point = [val CGPointValue];
		if (first_point) {
			CGContextMoveToPoint(context, point.x, point.y);
			first_point = false;
		}
		else {
			CGContextAddLineToPoint(context, point.x, point.y);
		}
	}

	CGContextClosePath(context);
	
	[polygonName setText: myPolygon.name];
	
	[[UIColor redColor] setFill];
	[[UIColor blackColor] setStroke];
	CGContextDrawPath(context, kCGPathFillStroke);	
}

+ (NSArray*)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides {
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
	float radius = 0.75 * center.x;
	NSMutableArray *result = [NSMutableArray array];
	float angle = (2.0 * M_PI) / numberOfSides;
	float exteriorAngle = M_PI - angle;
	float rotationDelta = angle - (0.5 * exteriorAngle);
	for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) {
		float newAngle = (angle * currentAngle) - rotationDelta;
		float curX = cos(newAngle) * radius;
		float curY = sin(newAngle) * radius;
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX,
																center.y + curY)]];
	}
	return result;
}
	
@end
