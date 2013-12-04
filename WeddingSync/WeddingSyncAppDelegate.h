//
//  WeddingSyncAppDelegate.h
//  WeddingSync
//
//  Created by Sean Gray on 12/1/13.
//  Copyright (c) 2013 Sean Gray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeddingSyncAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//database path
@property NSString *databasename;
@property NSString *databasepath;
@property NSArray *documentPaths;
@property NSString *documentsDir;
@property NSFileManager *appdelfilemanager;

@end
