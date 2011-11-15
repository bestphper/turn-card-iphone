//
//  MyCardAppDelegate.h
//  MyCard
//
//  Created by yang on 11-11-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyCardViewController;

@interface MyCardAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MyCardViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MyCardViewController *viewController;

@end

