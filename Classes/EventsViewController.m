//
//  EventsViewController.m
//  Birthday Facts
//
//  Created by jrk on 5/10/10.
//  Copyright 2010 flux forge. All rights reserved.
//

#import "EventsViewController.h"
#import "BornViewController.h"
#import "DiedViewController.h"
#import "WorldEventsViewController.h"

@implementation EventsViewController

#pragma mark -
#pragma mark override

- (void) setupMenuItems
{
	NSArray *arr = [NSArray arrayWithObjects:
					
					[MenuScreenViewController menuItemWithTitle: @"Born" 
													  imageName: @"three_item_menu_top.png" 
											  selectedImageName: @"menu_born_inv.png"
														 target: self
													   selector: @selector(showBorn:)],

					[MenuScreenViewController menuItemWithTitle: @"Died" 
													  imageName: @"three_item_menu_middle.png" 
											  selectedImageName: @"menu_died_inv.png"
														 target: self
													   selector: @selector(showDied:)],
					
					
					[MenuScreenViewController menuItemWithTitle: @"World Events" 
													  imageName: @"three_item_menu_bottom.png" 
											  selectedImageName: @"menu_worldevents_inv.png"
														 target: self
													   selector: @selector(showWorldEvents:)],
					nil];
	
	[self setMenuItems: arr];
}

- (void) didSelectMenuItemWithIndex: (NSUInteger) menuItemIndex
{
	NSLog(@"yay! selected index: %i", menuItemIndex);
}

- (void) showBorn: (id) sender
{
	BornViewController *vc = [BornViewController viewController];
	[vc setTitle: @"Born"];
	[[self navigationController] pushViewController: vc animated: YES];
}

- (void) showDied: (id) sender
{
	DiedViewController *vc = [DiedViewController viewController];
	[vc setTitle: @"Died"];
	[[self navigationController] pushViewController: vc animated: YES];
}

- (void) showWorldEvents: (id) sender
{
	WorldEventsViewController *vc = [WorldEventsViewController viewController];
	[vc setTitle: @"World Events"];
	[[self navigationController] pushViewController: vc animated: YES];
}

@end
