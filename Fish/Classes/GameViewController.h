//
//  GameViewController.h
//  Fish
//
//  Created by Daniel Loomb on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GameViewController : UIViewController {
	UILabel *scoreLabel;
}

-(IBAction)back;
-(IBAction)touchedButton;

@property (nonatomic, retain) IBOutlet UILabel *scoreLabel;

@end
