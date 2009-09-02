#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "Controller.h"

@class Controller;

@interface PolygonView : UIView {

	IBOutlet Controller *myController;
	IBOutlet UILabel *polygonName;
}

- (PolygonShape*)myPolygon;

+ (NSArray*)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;

@end