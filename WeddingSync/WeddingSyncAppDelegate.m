//
//  WeddingSyncAppDelegate.m
//  WeddingSync
//
//  Created by Sean Gray on 12/1/13.
//  Copyright (c) 2013 Sean Gray. All rights reserved.
//

#import "FMDatabase.h"
#import "WeddingSyncAppDelegate.h"

@implementation WeddingSyncAppDelegate

@synthesize databasename;
@synthesize databasepath;
@synthesize documentPaths;
@synthesize documentsDir;

//////////////////////////////////////////////////
// This function creates and then checks the db //
//////////////////////////////////////////////////
-(void) createAndCheckDatabase
{
    BOOL success;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:databasepath];
    
    if(success) return;
    
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.databasename];
    
    [fileManager copyItemAtPath:databasePathFromApp toPath:databasepath error:nil];
}

///////////////////////////////////////////////
// This function launches the db WEDDINGSYNC //
///////////////////////////////////////////////
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.databasename = @"WeddingSync.sqlite";
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [documentPaths objectAtIndex:0];
    self.databasepath = [documentDir stringByAppendingPathComponent:self.databasename];
    
    [self createAndCheckDatabase];
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
