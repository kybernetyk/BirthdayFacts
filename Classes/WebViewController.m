//
//  WebViewController.m
//  Birthday Facts
//
//  Created by jrk on 8/10/10.
//  Copyright 2010 flux forge. All rights reserved.
//

#import "WebViewController.h"


@implementation WebViewController
@synthesize webView = _webView;
@synthesize uri=_uri;


+ (id) viewControllerWithURI: (NSString *) uri
{
	id 	ret = [[self alloc] initWithNibName: @"WebViewController" bundle: nil];
	[ret setUri: uri];
	
	return [ret autorelease];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
	//   return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}



#pragma mark -
#pragma mark teardown

- (void) releaseOutlets
{
	NSLog(@"menu view controller releaseOutlets ...");
	[self setWebView: nil];	
}

- (void)dealloc 
{
	NSLog(@"menu view controller dealloc ...");
	[self releaseOutlets];
	
	[self setUri: nil];
	
    [super dealloc];
}

- (void)viewDidUnload 
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	
	[self releaseOutlets];
}

- (void)didReceiveMemoryWarning 
{
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
	
	
	NSURLRequest *req = [NSURLRequest requestWithURL: [NSURL URLWithString: [self uri]]];
	[[self webView] loadRequest: req];
	
	//[[self webView] setA
//	[self setBorderAndCornersForView: [self tableView]];
//	[self setBorderAndCornersForView: [self imageView]];
//	[[self tableView] setRowHeight: [[self rowHeight] floatValue] ];
//	[[self tableView] setSeparatorColor: [UIColor brownColor]];
	
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
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

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/



@end
