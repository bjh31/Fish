
#import "Fish.h"
#import "AccController.h"

AccController *acc;

float width = 768;
float height = 1002;
float ball_radius = 50;
float friction = .9;
float newX = 0;
float newY = 0;

float reboundX = 0;
float reboundY = 0;


@implementation Fish;
@synthesize XSpeed;
@synthesize YSpeed;

@synthesize XPos;
@synthesize YPos;

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
	//get x and y pos of the fish
	XPos = self.center.x + self.XSpeed;
	YPos = self.center.y + self.YSpeed;
	
	//if fish has hit wall have hit wall
	if(XPos > width || XPos < 0){
		XPos = XPos + (-1* (self.XSpeed * 4));
		[self setXSpeed:(self.YSpeed/2)];
		
		reboundX = self.XSpeed;
	}
	
	if(YPos > height || YPos < 0){
		YPos = YPos + (-1* (self.YSpeed * 4));
		[self setYSpeed:(self.YSpeed/2)];
		reboundY = self.YSpeed;
	}
	
	if(reboundX != 0){
		newX = reboundY;
		
		if(reboundX > 0){reboundX = reboundX - 1;}
		else{reboundX = reboundX + 1;}
	}
	else{
		newX = self.XSpeed;
	}
	
	if(reboundY != 0){
		newY = reboundY;
		
		if(reboundY > 0){reboundY = reboundY - 1;}
		else{reboundY = reboundY + 1;}
	}
	else{
		newY = self.YSpeed;
	}
	
		//set speed
		[self setXSpeed:newX + acc.gx]; [self setYSpeed:newY + acc.gy];
		[self setCenter:CGPointMake(XPos, YPos)];
	}


@end