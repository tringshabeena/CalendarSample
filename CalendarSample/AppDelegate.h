//
//  AppDelegate.h
//  CalendarSample
//
//  Created by Shabeena on 1/4/17.
//  Copyright © 2017 tringapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

