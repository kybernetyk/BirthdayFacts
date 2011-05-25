//
//  MainViewController2.h
//  Birthday Facts
//
//  Created by jrk on 5/10/10.
//  Copyright 2010 flux forge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuScreenViewController.h"

@interface MainViewController : MenuScreenViewController
{

}

- (void) checkForUserBirthDateExistance;
- (void) setUserBirthDate: (NSDate *) date;
- (NSDate *) userBirthDate;

@end
