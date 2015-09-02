//
//  IpCameraClientAppDelegate.h
//  IpCameraClient
//
//  Created by jiyonglong on 12-4-23.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class P2PCameraDemoViewController;
@interface IpCameraClientAppDelegate : NSObject <UIApplicationDelegate> {
    
    IBOutlet UIWindow *window;    
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) P2PCameraDemoViewController* p2pCameraVC;

@end

