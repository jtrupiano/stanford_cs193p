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
	
    [pool drain];
    return 0;
}
