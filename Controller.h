#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Controller : /* Specify a superclass (eg: NSObject or NSView) */ {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
}
- (IBAction)decrease;
- (IBAction)increase;
@end
