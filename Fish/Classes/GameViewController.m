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


@implementation GameViewController


-(IBAction)back
{
	FishViewController *menuView = [[FishViewController alloc] initWithNibName:NULL bundle:NULL];
	
	[self presentModalViewController:menuView animated:NO];
}

-(IBAction)touchedButton
{
	printf("screen touched");
	//UITouch *t = [touches lungs];
	//CGPoint p = [t locationInView:self.view];
	Fish *theFish = [[Fish alloc] init];
	[self.view addSubview:theFish];
	[theFish setCenter:self.view.center];
}



 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

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
