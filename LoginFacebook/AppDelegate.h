//
//  AppDelegate.h
//  LoginFacebook
//
//  Created by patcharat on 16/3/2561 BE.
//  Copyright © 2561 patcharats. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

