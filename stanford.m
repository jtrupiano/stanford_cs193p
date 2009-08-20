#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	NSString *path = @"~";
	
	path = [path stringByStandardizingPath];
    // insert code here...
	
	for (NSString *path_part in [path pathComponents]) {
		NSLog(@"%@", path_part);
	}

    NSLog(@"My home folder is at '%@'", path);
	
	NSLog(@"Process Name: '%@' Process ID: '%d'", [[NSProcessInfo processInfo] processName], [[NSProcessInfo processInfo] processIdentifier]);
	
    [pool drain];
    return 0;
}
