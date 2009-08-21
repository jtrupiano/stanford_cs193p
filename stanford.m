#import <Foundation/Foundation.h>

void section1();
void section2();
void section3();

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	section1();
	section2();
	section3();
		
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
			NSLog(@"%@", [NSString stringWithContentsOfURL:[NSURL URLWithString:url]]);
		} 
		else {
			NSLog(@"%@ does not begin with Stanford", key);
		}
	}
}