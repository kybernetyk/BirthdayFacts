//
//  DataViewController.h
//  Birthday Facts
//
//  Created by jrk on 7/10/10.
//  Copyright 2010 flux forge. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DataViewController : UIViewController 
{
	UITableView *_tableView;
	UIImageView *_imageView;
}

@property (readwrite, retain) IBOutlet UITableView *tableView;
@property (readwrite, retain) IBOutlet UIImageView *imageView;

+ (id) viewController;

@end


@interface DataViewController (PureVirtual)
- (NSArray *) dataSource;
@end


@interface DataViewController (Virtual)
- (UITableViewCell *) newCellWithIdentifier: (NSString *) cellIdentifier;
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end


