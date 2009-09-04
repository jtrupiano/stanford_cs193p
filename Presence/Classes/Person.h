//
//  Person.h
//  Presence
//
//  Created by John Trupiano on 9/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

@interface Person : NSObject {
	NSString *name;
	NSString *status;
	NSString *imageReference;
}

- (id)init;

- (id)initWithValues:(NSString *)name status:(NSString*)status image:(NSString*)image;

@property(retain) NSString *name;
@property(retain) NSString *status;
@property(retain) NSString *imageReference;

@end
