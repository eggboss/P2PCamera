//
//  P2PCameraDemoViewController.h
//  P2PCamera
//
//  Created by yan luke on 13-6-13.
//
//

#import <UIKit/UIKit.h>
#include "PPPP_API.h"
#include "PPPPChannelManagement.h"
#import "ImageNotifyProtocol.h"
#import "SearchCameraResultProtocol.h"
#import "SearchDVS.h"
#import "ParamNotifyProtocol.h"
#import "CameraControlViewController.h"
@interface P2PCameraDemoViewController : UIViewController<ImageNotifyProtocol, SearchCameraResultProtocol, ParamNotifyProtocol>{
    CSearchDVS* dvs;
    /*镜像参数*/
    int flip;
    CGPoint beginPoint;
}
@property (nonatomic, retain) IBOutlet UIImageView* playView;
@property  CPPPPChannelManagement* m_PPPPChannelMgt;
@property (nonatomic, retain) NSTimer* searchTimer;
@property (nonatomic,assign) CGPoint beginPoint;
- (IBAction)Initialize:(id)sender;
- (IBAction)ConnectCam:(id)sender;
- (IBAction)starVideo:(id)sender;
- (IBAction)starAudio:(id)sender;
- (IBAction)stopAudio:(id)sender;
- (IBAction)startTalk:(id)sender;
- (IBAction)stopTalk:(id)sender;
- (IBAction)mirrorImage:(id)sender;
- (IBAction)resolutionVideo:(id)sender;
- (IBAction)stopVideo:(id)sender;
- (IBAction)stopCamera:(id)sender;

- (IBAction) startSearch;
- (IBAction) ptzController:(id)sender;

- (IBAction) PushToCamCtr:(id)sender;

- (IBAction)btnUp:(id)sender;
- (IBAction)btnDown:(id)sender;
- (IBAction)btnRight:(id)sender;
- (IBAction)btnLeft:(id)sender;



@end
