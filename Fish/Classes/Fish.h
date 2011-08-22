
#import <UIKit/UIKit.h>


@interface Fish : UIImageView {
    float XSpeed;
    float YSpeed;
}

@property float XSpeed;
@property float YSpeed;

-(void) updateFish;

@end
