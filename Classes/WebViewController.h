//
//  WebViewController.h
//  Birthday Facts
//
//  Created by jrk on 8/10/10.
//  Copyright 2010 flux forge. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController 
{
	UIWebView *_webView;
	
	
	NSString *_uri;
}

@property (readwrite, retain) IBOutlet UIWebView *webView;

@property (readwrite, retain) NSString *uri;

+ (id) viewControllerWithURI: (NSString *) uri;

@end
