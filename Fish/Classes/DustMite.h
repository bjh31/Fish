//
//  DustMite.h
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DustMite : UIImageView {
	float XSpeed;
	float YSpeed;
}

@property float XSpeed;
@property float YSpeed;

@property float XPos;
@property float YPos;

-(void) updateMite;

@end
