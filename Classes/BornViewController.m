//
//  BornViewController.m
//  Birthday Facts
//
//  Created by jrk on 8/10/10.
//  Copyright 2010 flux forge. All rights reserved.
//

#import "BornViewController.h"


@implementation BornViewController
#pragma mark -
#pragma mark override
- (NSArray *) dataSource
{
	return [NSArray arrayWithObjects: @"World Pop @ ur birthday: 1234 Jews", @"penis", @"hurrenson", @"fickbumse", @"judenfert", nil];
}

@end
