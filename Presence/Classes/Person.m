//
//  Person.m
//  Presence
//
//  Created by John Trupiano on 9/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name;
@synthesize status;
@synthesize imageReference;

- (id)init {
	return [self initWithValues:@"John" status:@"Omnipresent" image:@"avatar.jpg"];
}

- (id)initWithValues:(NSString *)the_name status:(NSString*)the_status image:(NSString*)image {
	if (self = [super init]) {
		self.name = the_name;
		self.status = the_status;
		self.imageReference = image;
	}
	return self;
}

@end
