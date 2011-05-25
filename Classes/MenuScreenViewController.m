//
//  MenuScreenViewController.m
//  Birthday Facts
//
//  Created by jrk on 5/10/10.
//  Copyright 2010 flux forge. All rights reserved.
//

#import "MenuScreenViewController.h"
#import "UIViewController+CornersAndBorders.h"

@implementation MenuScreenViewController
@synthesize tableView=_tableView;
@synthesize imageView=_imageView;

@synthesize menuItems=_menuItems;
@synthesize rowHeight=_rowHeight;

+ (id) viewControllerWithMenuItmes: (NSArray *) menuItems
{
	MenuScreenViewController *ret = [[self alloc] initWithMenuItems: menuItems];
	
	return [ret autorelease];
}

+ (id) viewController
{
	return [self viewControllerWithMenuItmes: nil];
}

- (id) initWithMenuItems: (NSArray *) menuItems
{
	self = [super initWithNibName: @"MenuScreenViewController"
						   bundle: nil];
	if (self)
	{
		if (!menuItems)
		{
			[self setupMenuItems]; //sets menu items
		}
		else
		{
			[self setMenuItems: menuItems];
		}

		if ([self menuItems])
		{
			float rowHeight = 200.0f;
			rowHeight /= [[self menuItems] count];
			[self setRowHeight: [NSNumber numberWithFloat: rowHeight]];
		}
		else
		{
			NSAssert(0,@"no menu items!");
			[self setRowHeight: [NSNumber numberWithFloat: 100.0f]];
		}
		
	}
	
	return self;
}

#pragma mark -
#pragma mark teardown

- (void) releaseOutlets
{
	NSLog(@"menu view controller releaseOutlets ...");
	[self setTableView: nil];
	[self setImageView: nil];
	
}

- (void)dealloc 
{
	NSLog(@"menu view controller dealloc ...");
	[self releaseOutlets];
	
	[self setRowHeight: nil];
	[self setMenuItems: nil];
	
    [super dealloc];
}

- (void)viewDidUnload 
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	
	[self releaseOutlets];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



#pragma mark  -
#pragma mark init
- (void)viewDidLoad 
{
	NSLog(@"did load");
	[super viewDidLoad];
	
	[self setBorderAndCornersForView: [self tableView]];
	//[self setBorderAndCornersForView: [self imageView]];
	[[self tableView] setRowHeight: [[self rowHeight] floatValue] ];
	[[self tableView] setSeparatorColor: [UIColor colorWithRed: 210.0/255.0  
														 green: 207.0/255.0 
														  blue: 194.0/255.0 
														 alpha: 1.0]];
	
}



#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return [[self menuItems] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"FXMainViewTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	NSUInteger currentIndex = [indexPath row];
	NSDictionary *menuItem = [[self menuItems] objectAtIndex: currentIndex];
	
	NSAssert ([menuItem isKindOfClass: [NSDictionary class]], @"Menu Item is not a Dictionary!");
	
	
	UIImageView *cellBackgroundView = [[UIImageView alloc] initWithImage: 
									   [UIImage imageNamed: [menuItem objectForKey: @"imageName"]]];

	/*UIImageView *cellSelectedBackgroundView = [[UIImageView alloc] initWithImage:
											   [UIImage imageNamed: [menuItem objectForKey: @"selectedImageName"]]];
	*/
											   
	NSAssert (cellBackgroundView, @"No cellBackgroundView!" );										   
	//NSAssert (cellSelectedBackgroundView, @"No cellSelectedBackgroundView!" );										   
	
	[cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
	[cell setBackgroundView: cellBackgroundView];
	//[cell setSelectedBackgroundView: cellSelectedBackgroundView];
	[[cell textLabel] setText: [menuItem objectForKey: @"title"]];
	[[cell textLabel] setOpaque: NO];
	[[cell textLabel] setBackgroundColor: [UIColor clearColor]];
	
	[cellBackgroundView release];
//	[cellSelectedBackgroundView release];
    return cell;
}

/*- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 return 50.0f;
 }*/


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */



- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // The table view should not be re-orderable.
    return NO;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	[[self tableView] deselectRowAtIndexPath: indexPath animated: YES];
	
	[self didSelectMenuItemWithIndex: [indexPath row]];
	
	NSDictionary *menuItem = [[self menuItems] objectAtIndex: [indexPath row]];
	NSAssert(menuItem, @"No menu item with that index!");
	
	
	id <NSObject> target = [menuItem objectForKey: @"target"];
	NSString *selectorString = [menuItem objectForKey: @"selector"];
	
	if (!target)
		target = self;
	
	if (!selectorString)
		return;
	

	SEL outSelector = NSSelectorFromString(selectorString);
	
	[target performSelector: outSelector withObject: self];

	
}
@end
#pragma mark -
#pragma mark virtual

@implementation MenuScreenViewController (FXPureVirtual)

- (void) didSelectMenuItemWithIndex: (NSUInteger) menuItemIndex
{
	NSAssert(0,@"This is a pure virtual method! MenuScreenViewController.m : selectedMenuItemIndex:");
}

- (void) setupMenuItems
{
	NSAssert(0,@"This is a pure virtual method! MenuScreenViewController.m : setupMenuItems:\nYou have to implement this if you choose not to initWithMenuItems:!");	
}

@end

#pragma mark -
#pragma mark helpers
@implementation MenuScreenViewController (FXHelper)
+ (NSDictionary *) menuItemWithTitle: (NSString *) title 
						   imageName: (NSString *) imageName 
				   selectedImageName: (NSString *) selectedImageName
							  target: (id) target
							selector: (SEL) selector
{
	NSMutableDictionary *tmp = [NSMutableDictionary dictionary];

	
	
	if (title)
		[tmp setObject: title forKey: @"title"];

	if (imageName)
		[tmp setObject: imageName forKey: @"imageName"];	

	if (selectedImageName)
		[tmp setObject: selectedImageName forKey: @"selectedImageName"];	

	if (target)
		[tmp setObject: target forKey: @"target"];	

	if (selector)
	{	
		NSString *selectorAsString = NSStringFromSelector(selector);
		[tmp setObject: selectorAsString forKey: @"selector"];	
	}
	
	NSDictionary *ret = [NSDictionary dictionaryWithDictionary: tmp];
	return ret;
}

+ (NSDictionary *) menuItemWithTitle: (NSString *) title 
						   imageName: (NSString *) imageName 
				   selectedImageName: (NSString *) selectedImageName
{
	return [self menuItemWithTitle: title 
						 imageName: imageName
				 selectedImageName: selectedImageName 
							target: nil 
						  selector: nil];
}

@end

