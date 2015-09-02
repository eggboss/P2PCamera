//
//  IpCameraClientAppDelegate.m
//  IpCameraClient
//
//  Created by jiyonglong on 12-4-23.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "IpCameraClientAppDelegate.h"
#import "obj_common.h"
#import "libH264Dec.h"
#import "P2PCameraDemoViewController.h"
@implementation IpCameraClientAppDelegate

@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    //hide the status bar
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
        
    
    _p2pCameraVC = [[P2PCameraDemoViewController alloc] init];
    
    [self.window setRootViewController:_p2pCameraVC];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)dealloc 
{
    //NSLog(@"IpCameraClientAppDelegate dealloc");
    self.window = nil;
    [_p2pCameraVC release],_p2pCameraVC = nil;
    [super dealloc];
}


-(void)getFree{
    NSString* path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] ;
    NSFileManager* fileManager = [[NSFileManager alloc ]init];
    NSDictionary *fileSysAttributes = [fileManager attributesOfFileSystemForPath:path error:nil];
    NSNumber *freeSpace = [fileSysAttributes objectForKey:NSFileSystemFreeSize];
    NSNumber *totalSpace = [fileSysAttributes objectForKey:NSFileSystemSize];
    NSLog(@"freeSpace=%f  totalSpace=%f",([freeSpace longLongValue])/1024.0/1024.0/1024,([totalSpace longLongValue])/1024.0/1024/1024);
}

@end
