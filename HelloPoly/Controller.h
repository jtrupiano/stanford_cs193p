#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonView.h"

@class PolygonView;

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
	
	IBOutlet PolygonView *polygonView;	
	IBOutlet PolygonShape *myPolygon;
}

@property (readonly) PolygonShape* myPolygon;

- (IBAction)decrease;
- (IBAction)increase;

// private
- (void)updateInterface;
- (void)updateUserPreferences;

@end
