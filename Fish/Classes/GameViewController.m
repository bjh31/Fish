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
		theFish = [[Fish alloc] init];
		[self.view addSubview:theFish];
		[theFish setCenter:self.view.center];
		
		theMite = [[DustMite alloc] init];
		[self.view addSubview:theMite];
		
		[theMite setCenter:self.view.center];
		
		[NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(checkCollision) userInfo:nil repeats:true];
    }
    return self;
}

-(void)checkCollision
{
	if(theFish.YPos > (theMite.YPos-30) && theFish.YPos < (theMite.YPos +30)){
		if(theFish.XPos > (theMite.XPos-30) && theFish.XPos < (theMite.XPos +30))
			printf("HIT!\n");
		printf("%f",score);
		score = score + 10;
		
		NSString *theScore = [NSString stringWithFormat:@"Score: %f",score];			  
		[scoreLabel setText:theScore];
		
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
