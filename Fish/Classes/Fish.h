
#import <UIKit/UIKit.h>


@interface Fish : UIImageView {
    float XSpeed;
    float YSpeed;
	float XPos;
	float YPos;
}

@property float XSpeed;
@property float YSpeed;

@property float XPos;
@property float YPos;

-(void) updateFish;
-(void) hit;

@end
