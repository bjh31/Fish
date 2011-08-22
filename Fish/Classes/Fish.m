
#import "Fish.h"
#import "AccController.h"

AccController *acc;

float width = 768;
float height = 1002;
float ball_radius = 50;
float friction = .9;

@implementation Fish;
@synthesize XSpeed;
@synthesize YSpeed;

- (id)init {
    self = [super initWithImage:[UIImage imageNamed:@"fish.png"]];
    if (self) {
        if(!acc)
        {
            acc = [[AccController alloc] init];
        }
        [self setFrame:CGRectMake(0, 0, ball_radius*2, ball_radius*2)];
        
        [NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(updateFish) userInfo:nil repeats:true];
    }
    return self;
}

-(void) updateFish
{
	
	CGFloat xpos = self.center.x + self.XSpeed;
	CGFloat ypos = self.center.y + self.YSpeed;
	
	if(xpos > width || xpos < 0){
		xpos = xpos + (-1* (self.XSpeed * 4));
		[self setXSpeed:(self.YSpeed/2)];
	}
	
	if(ypos > height || ypos < 0){
		ypos = ypos + (-1* (self.YSpeed * 4));
		[self setYSpeed:(self.YSpeed/2)];
	}
	
	[self setXSpeed:self.XSpeed + acc.gx]; [self setYSpeed:self.YSpeed + acc.gy];
	[self setCenter:CGPointMake(xpos, ypos)];
	
	
	
}
@end