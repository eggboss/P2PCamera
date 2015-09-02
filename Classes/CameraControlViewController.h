//
//  CameraControlViewController.h
//  P2PCamera
//
//  Created by yan luke on 14-3-18.
//
//

#import <UIKit/UIKit.h>
#import "PPPPChannelManagement.h"
#import "DateTimeProtocol.h"
#import "SdcardScheduleProtocol.h"
#import "WifiParamsProtocol.h"
#import "SDCardRecordFileSearchProtocol.h"

@interface CameraControlViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) IBOutlet UITableView* aTableView;
@property CPPPPChannelManagement* m_PPPPChannelMgt;
@property (nonatomic, retain) NSString* strDID;
@end
