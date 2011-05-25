//
//  DataViewController.m
//  Birthday Facts
//
//  Created by jrk on 7/10/10.
//  Copyright 2010 flux forge. All rights reserved.
//

#import "DataViewController.h"
#import "WebViewController.h"

@implementation DataViewController
@synthesize tableView=_tableView;
@synthesize imageView=_imageView;

#pragma mark -
#pragma mark class methods
+ (id) viewController
{
	DataViewController *dvc = [[self alloc] initWithNibName: @"DataViewController"
																   bundle: nil];
	[dvc autorelease];
	
	return dvc;
}


#pragma mark -
#pragma mark teardown

- (void) releaseOutlets
{
	NSLog(@"DataViewController releaseOutlets ...");
	[self setTableView: nil];
	
}

- (void)dealloc 
{
	NSLog(@"DataViewController dealloc ...");
	[self releaseOutlets];

    [super dealloc];
}

- (void)viewDidUnload 
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	
	[self releaseOutlets];
}


#pragma mark -
#pragma mark init

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	NSLog(@"did load");
	[super viewDidLoad];
	
	[self setBorderAndCornersForView: [self tableView]];
//	[self setBorderAndCornersForView: [self imageView]];
	[[self tableView] setSeparatorColor: [UIColor colorWithRed: 210.0/255.0  
														 green: 207.0/255.0 
														  blue: 194.0/255.0 
														 alpha: 1.0]];
	
	[[self tableView] setRowHeight: 100.0f];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning 
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return [[self dataSource] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"FXDataViewTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
	{
       // cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell = [[self newCellWithIdentifier: CellIdentifier] autorelease];

		
		NSString *imageName = @"two_item_menu_bottom.png";
		if ([indexPath row] == 0)
		{
			imageName = @"two_item_menu_top.png";
		}
		
		
		UIImageView *cellBackgroundView = [[UIImageView alloc] initWithImage: 
										   [UIImage imageNamed: imageName ]];
		
		[cell setBackgroundView: cellBackgroundView];
		[cellBackgroundView release];
		
		[[cell textLabel] setOpaque: NO];
		[[cell textLabel] setBackgroundColor: [UIColor clearColor]];
		
		[[cell detailTextLabel] setOpaque: NO];
		[[cell detailTextLabel] setBackgroundColor: [UIColor clearColor]];
    }
	
	//[[cell textLabel] setText: @"test"];
	
	
	
	[self configureCell: cell atIndexPath: indexPath];
    
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



- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath 
{
    // The table view should not be re-orderable.
    return NO;
}



#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	[[self tableView] deselectRowAtIndexPath: indexPath animated: YES];
	
	[self didSelectMenuItemWithIndex: [indexPath row]];
}
/*
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
	
	
}*/
@end

@implementation DataViewController (Virtual)
#pragma mark -
#pragma mark virtual
- (UITableViewCell *) newCellWithIdentifier: (NSString *) cellIdentifier
{
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
	
	return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath 
{
	CGRect r = [cell frame];
	r.size.height = 100.0f;
	[cell setFrame: r];
	
//	[[cell textLabel] setOpaque: YES];
//	[[cell textLabel] setBackgroundColor: [UIColor whiteColor]];
	
//	[[cell contentView] setOpaque: YES];
//	[[cell contentView] setBackgroundColor: [UIColor whiteColor]];
	[cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
	[[cell textLabel] setText: [[[self dataSource] objectAtIndex: [indexPath row]] description]];
	[[cell detailTextLabel] setText: @"We must gather Plankton so our overlords won't destroy us!\nFear the branchiated overlords' wrath, infidels!"];
	[[cell detailTextLabel] setNumberOfLines: 4];
}
@end

@implementation DataViewController (PureVirtual)
#pragma mark -
#pragma mark pure virtual
- (NSArray *) dataSource
{
	NSAssert(0,@"This is a pure virtual class. Please override -(NSArray *)	dataSource!");
	
	return nil;
}

- (void) didSelectMenuItemWithIndex: (NSUInteger) menuItemIndex
{
	//NSAssert(0,@"This is a pure virtual method! MenuScreenViewController.m : selectedMenuItemIndex:");
	WebViewController *wvc = [WebViewController viewControllerWithURI: @"http://www.fluxforge.com"];
	[wvc setTitle: [[[self dataSource] objectAtIndex: menuItemIndex] description]];
	[[self navigationController] pushViewController: wvc animated: YES];
}


@end
