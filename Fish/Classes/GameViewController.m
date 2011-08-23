    //
//  GameViewController.m
//  Fish
//
//  Created by Daniel Loomb on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"
#import "FishViewController.h"
#import "Fish.h"
#import "DustMite.h"


@implementation GameViewController

@synthesize scoreLabel;

Fish *theFish;
DustMite *theMite;
float score = 0;

-(IBAction)back
{
	FishViewController *menuView = [[FishViewController alloc] initWithNibName:NULL bundle:NULL];
	
	[self presentModalViewController:menuView animated:NO];
}

-(IBAction)touchedButton
{

	
}



 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
		//instantiate the fish
		theFish = [[Fish alloc] init];
		[self.view addSubview:theFish];
		[theFish setCenter:self.view.center];
		
		//instantiate the mite
		theMite = [[DustMite alloc] init];
		[self.view addSubview:theMite];		
		CGPoint p = CGPointMake(100,100);
		[theMite setCenter:p];
		
		//make a timer to check for collisions
		[NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(checkCollision) userInfo:nil repeats:true];
    }
    return self;
}

-(void)checkCollision
{
	if(theFish.YPos > (theMite.YPos-70) && theFish.YPos < (theMite.YPos +70)){
		if(theFish.XPos > (theMite.XPos-70) && theFish.XPos < (theMite.XPos +70))
		{
			printf("HIT!\n");
			
			[theFish hit];
			[theMite hit];
			
			//calculate the score and update the score label	
			score = score + 10;		
			NSString *theScore = [NSString stringWithFormat:@"Score: %f",score];			  
			[scoreLabel setText:theScore];
		}
	}
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/





- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
