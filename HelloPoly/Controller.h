#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonView.h"

@class PolygonView;

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
	IBOutlet UISlider *slider;
	
	IBOutlet PolygonView *polygonView;	
	IBOutlet PolygonShape *myPolygon;
}

- (IBAction)decrease;
- (IBAction)increase;
- (IBAction)sliderChanged:(id)sender;

// private
- (void)updateInterface:(int)sides;
- (void)updateUserPreferences;

@end
