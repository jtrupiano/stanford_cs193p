#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
	
	IBOutlet PolygonShape* myPolygon;
}

- (IBAction)decrease;
- (IBAction)increase;

// private
- (void)updateInterface;
- (void)updatePolygon:(int)sides;

@end
