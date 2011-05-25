//
//  UIViewController+CornersAndBorders.m
//  Birthday Facts
//
//  Created by jrk on 4/10/10.
//  Copyright 2010 flux forge. All rights reserved.
//

#import "UIViewController+CornersAndBorders.h"
#import <QuartzCore/QuartzCore.h>

#define K_CORNER_RADIUS 8.0f
#define K_BORDER_WIDTH 1.0f

@implementation UIViewController (CornersAndBorders)

- (void) setBorderAndCornersForView: (UIView *) aView
{
	//#d2cfc2
	UIColor *borderColor = [UIColor colorWithRed: 210.0/255.0  green: 207.0/255.0 blue: 194.0/255.0 alpha: 1.0];
	
	
	[[aView layer] setCornerRadius: K_CORNER_RADIUS];
	[[aView layer] setMasksToBounds: YES];
	[[aView layer] setBorderColor: [borderColor CGColor]];
	[[aView layer] setBorderWidth: K_BORDER_WIDTH];
	

}

- (void) setCornersForView: (UIView *) aView
{
	[[aView layer] setCornerRadius: K_CORNER_RADIUS];
	[[aView layer] setMasksToBounds: YES];
}

@end
