//
//  DustMite.m
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DustMite.h"


@implementation DustMite
@synthesize XSpeed;
@synthesize YSpeed;

@synthesize XPos;
@synthesize YPos;

float screen_width = 768;
float screen_height = 1002;
float mite_radius = 50;

float xdir = 5;
float ydir = 5;

- (id)init {
    self = [super initWithImage:[UIImage imageNamed:@"dust_mite.jpg"]];
    
        [self setFrame:CGRectMake(0, 0, mite_radius*2.5, mite_radius*2)];
        
        [NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(updateMite) userInfo:nil repeats:true];
    
    return self;
}

-(void) updateMite
{
	XPos = self.center.x;
	YPos = self.center.y;
	
	CGFloat xpos = XPos + xdir;
	CGFloat ypos = YPos+ ydir;
	
	if(xpos > screen_width || xpos <0){
		xdir = xdir *-1;
	}
	if(ypos > screen_height || ypos < 0){
		ydir = ydir *-1;
	}
	
	[self setCenter:CGPointMake(xpos, ypos)];
}

@end
