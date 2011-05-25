//
//  FactsViewController.m
//  Birthday Facts
//
//  Created by jrk on 5/10/10.
//  Copyright 2010 flux forge. All rights reserved.
//

#import "FactsViewController.h"


@implementation FactsViewController

- (void) setupMenuItems
{
	NSArray *arr = [NSArray arrayWithObjects:
					[MenuScreenViewController menuItemWithTitle: @"Statistics" 
													  imageName: @"two_item_menu_top.png" 
											  selectedImageName: @"menu_statistics_inv.png"
														 target: self
													   selector: @selector(showStatistics:)],
					
					[MenuScreenViewController menuItemWithTitle: @"Numbers" 
													  imageName: @"two_item_menu_bottom.png" 
											  selectedImageName: @"menu_numbers_inv.png"
														 target: self
													   selector: @selector(showNumbers:)],
					
					nil];
	
	[self setMenuItems: arr];
}

- (void) didSelectMenuItemWithIndex: (NSUInteger) menuItemIndex
{
	NSLog(@"yay! selected index: %i", menuItemIndex);
}

#pragma mark -
#pragma mark handler
- (void) showNumbers: (id) sender
{
	NSLog(@"showing numbers ...");
	
	NumbersViewController *nvc = [NumbersViewController viewController];
	[nvc setTitle: @"Numbers"];
	
	[[self navigationController] pushViewController: nvc animated: YES];
	
}

- (void) showStatistics: (id) sender
{
	NSLog(@"showing statistics ...");
	
	StatisticsViewController *svc = [StatisticsViewController viewController];
	[svc setTitle: @"Statistics"];
	
	[[self navigationController] pushViewController: svc animated: YES];
	
}

@end
