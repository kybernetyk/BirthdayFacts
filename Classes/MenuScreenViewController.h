//
//  MenuScreenViewController.h
//  Birthday Facts
//
//  Created by jrk on 5/10/10.
//  Copyright 2010 flux forge. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MenuScreenViewController : UIViewController 
{
	UITableView *_tableView;
	UIImageView *_imageView;

	NSNumber *_rowHeight;
	NSArray *_menuItems;
}

@property (readwrite, retain) IBOutlet UITableView *tableView;
@property (readwrite, retain) IBOutlet UIImageView *imageView;


@property (readwrite, retain) NSArray *menuItems;
@property (readwrite, retain) NSNumber *rowHeight;

- (id) initWithMenuItems: (NSArray *) menuItems;

+ (id) viewControllerWithMenuItmes: (NSArray *) menuItems;
+ (id) viewController;

@end

@interface MenuScreenViewController (FXHelper)
+ (NSDictionary *) menuItemWithTitle: (NSString *) title 
						   imageName: (NSString *) imageName 
				   selectedImageName: (NSString *) selectedImageName
							  target: (id) target
							selector: (SEL) selector;

+ (NSDictionary *) menuItemWithTitle: (NSString *) title 
						   imageName: (NSString *) imageName 
				   selectedImageName: (NSString *) selectedImageName;
@end

@interface MenuScreenViewController (FXPureVirtual)
- (void) didSelectMenuItemWithIndex: (NSUInteger) menuItemIndex;
- (void) setupMenuItems;

@end


