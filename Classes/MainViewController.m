//
//  MainViewController2.m
//  Birthday Facts
//
//  Created by jrk on 5/10/10.
//  Copyright 2010 flux forge. All rights reserved.
//

#import "MainViewController.h"
#import "FactsViewController.h"
#import "EventsViewController.h"

@implementation MainViewController
- (void)viewDidLoad 
{
    [super viewDidLoad];
	
	UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
	[button setImage:[UIImage imageNamed:@"11-clock.png"] forState:UIControlStateNormal];
	[button setShowsTouchWhenHighlighted: YES];
	[button addTarget:self action:@selector(changeUserBirthDate:) forControlEvents:UIControlEventTouchUpInside];
	
	UIBarButtonItem *favorite = [[UIBarButtonItem alloc] initWithCustomView:button];
	[button release];
	
	[[self navigationItem] setLeftBarButtonItem: favorite];
	[button release];
}


#pragma mark -
#pragma mark override
- (void) setupMenuItems
{
	NSArray *arr = [NSArray arrayWithObjects:
					
					[MenuScreenViewController menuItemWithTitle: @"Facts" 
													  imageName: @"two_item_menu_top.png" 
											  selectedImageName: @"menu_facts_inv.png"
														 target: self
													   selector: @selector(showBirthdayFacts:)],
					
					[MenuScreenViewController menuItemWithTitle: @"Events" 
													  imageName: @"two_item_menu_bottom.png" 
											  selectedImageName: @"menu_events_inv.png"
														 target: self
													   selector: @selector(showBirthdayEvents:)],
					nil];
	
	[self setMenuItems: arr];
}

- (void) didSelectMenuItemWithIndex: (NSUInteger) menuItemIndex
{
	NSLog(@"yay! selected index: %i", menuItemIndex);
	
	[self checkForUserBirthDateExistance];
}

#pragma mark -
#pragma mark handler
#pragma mark -
#pragma mark event handler
- (void) changeUserBirthDate: (id) sender
{
	NSLog(@"changing user bdate");
}

- (void) showBirthdayFacts: (id) sender
{
	FactsViewController *msvc = [FactsViewController viewController];
	[msvc setTitle: @"Birthday Facts"];
	
	[[self navigationController] pushViewController: msvc animated: YES];
	
}

- (void) showBirthdayEvents: (id) sender
{
	EventsViewController *evvc = [EventsViewController viewController];
	[evvc setTitle: @"Birthday Events"];
	
	[[self navigationController] pushViewController: evvc animated: YES];
	
	
}

#pragma mark -
#pragma mark stuff
- (NSDate *) userBirthDate
{
	NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
	return [defs objectForKey: @"BirthDate"];
}

- (void) setUserBirthDate: (NSDate *) date
{
	NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
	[defs setObject: date forKey: @"BirthDate"];
	[defs synchronize];
}

- (void) checkForUserBirthDateExistance
{
	if (![self userBirthDate])
	{
		[self changeUserBirthDate: self];
	}
}


@end
