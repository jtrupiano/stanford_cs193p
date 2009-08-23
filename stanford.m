#import <Foundation/Foundation.h>
#import "PolygonShape.h"

void section1();
void section2();
void section3();
void section4();
void addPolygon(PolygonShape*, NSMutableArray*);
void PrintPolygonInfo();

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	section1();
	section2();
	section3();
	section4();
	PrintPolygonInfo();
	
    [pool drain];
    return 0;
}

void section1() {
	NSString *path = @"~";
	
	path = [path stringByStandardizingPath];
    NSLog(@"My home folder is at '%@'", path);
	
	for (NSString *path_part in [path pathComponents]) {
		NSLog(@"%@", path_part);
	}
}

void section2() {
	NSLog(@"Process Name: '%@' Process ID: '%d'", [[NSProcessInfo processInfo] processName], [[NSProcessInfo processInfo] processIdentifier]);
}

void section3() {
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:5];
	[dict setValue: @"http://www.stanford.edu" forKey:@"Stanford University"];
	[dict setValue: @"http://www.apple.com" forKey:@"Apple"];
	[dict setValue: @"http://cs193p.stanford.edu" forKey:@"CS193P"];
	[dict setValue: @"http://itunes.stanford.edu" forKey:@"Stanford on iTunes U"];
	[dict setValue: @"http://stanfordshop.com" forKey:@"Stanford Mall"];
	
	for (NSString *key in [dict allKeys]) {
		if ([key hasPrefix:@"Stanford"]) {
			NSString *url = [dict valueForKey:key];
			//NSLog(@"%@", [NSString stringWithContentsOfURL:[NSURL URLWithString:url]]);
			NSLog(@"%@ does begin with Stanford", url);
		} 
	}
}

void section4() {
	NSString *string = @"String me";
	NSURL *url = [NSURL URLWithString:@"http://www.justfuckinggoogleit.com"];
	NSProcessInfo *info = [NSProcessInfo processInfo];
	NSDictionary *dict = [NSDictionary dictionary];
	NSMutableString *mutable_string = @"Oh yeah, you can change me!";
	
	NSArray *array = [NSArray arrayWithObjects:string, url, info, dict, mutable_string, nil];
	for (id item in array) {
		NSLog(@"I am '%@'", item);
		if ([item isMemberOfClass:[NSString class]]) {
			NSLog(@"I am indeed a member of NSString");
		}
		if ([item isKindOfClass:[NSString class]]) {
			NSLog(@"And I am a kind of NSString");
		}
		SEL sel = @selector(lowercaseString:);
		if ([item respondsToSelector:sel]) {
			NSLog(@"I do respond to lowercaseString with: %@", [item performSelector:sel]);
		}
	}
	
}

void addPolygon(PolygonShape *poly, NSMutableArray *polygons) {
	[polygons addObject:poly];
	NSLog(@"%@", poly);
}

void PrintPolygonInfo() {
	NSMutableArray *polygons = [[NSMutableArray alloc] init];
	
	PolygonShape *poly1 = [[PolygonShape alloc] init];
	[poly1 setMinimumNumberOfSides:3];
	[poly1 setMaximumNumberOfSides:7];
	[poly1 setNumberOfSides:3];
	addPolygon(poly1, polygons);
	
	PolygonShape *poly2 = [[PolygonShape alloc] initWithNumberOfSides:6 minimumNumberOfSides:5 maximumNumberOfSides:9];
	addPolygon(poly2, polygons);
	
	PolygonShape *poly3 = [[PolygonShape alloc] initWithNumberOfSides:12 minimumNumberOfSides:9 maximumNumberOfSides:12];
	addPolygon(poly3, polygons);
	
	for (PolygonShape *poly in polygons) {
		[poly setNumberOfSides:10];
	}
	
	[poly3 release];
	[poly2 release];
	[poly1 release];
	[polygons release];
}