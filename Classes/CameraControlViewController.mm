//
//  CameraControlViewController.m
//  P2PCamera
//
//  Created by yan luke on 14-3-18.
//
//

#import "CameraControlViewController.h"
#include "cmdhead.h"

@interface CameraControlViewController ()

@end

@implementation CameraControlViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellIden = @"cellIden";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIden];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIden] autorelease];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"格式化sd卡";
            break;
        case 1:
            cell.textLabel.text = @"修改摄像机密码";
            break;
        case 2:
            cell.textLabel.text = @"重启摄像机";
            break;
        case 3:
            cell.textLabel.text = @"播放tf录像";
            break;
        case 4:
            cell.textLabel.text = @"报警设置";
            break;
            
        default:
            break;
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            _m_PPPPChannelMgt->GetCGI((char*)[_strDID UTF8String], CGI_IEFORMATSD);
        }
            break;
        case 1:
        {
            _m_PPPPChannelMgt->SetUserPwd((char*)[self.strDID UTF8String], (char *)"", (char *)"", (char *)"", (char *)"", (char *)[@"my摄像机" UTF8String], (char *)[@"888888" UTF8String]);
        }
            break;
        case 2:
        {
            //重启摄像机
            _m_PPPPChannelMgt->PPPPSetSystemParams((char*)[self.strDID UTF8String], MSG_TYPE_REBOOT_DEVICE, NULL, 0);        }
            break;
        case 3:
        {
            _m_PPPPChannelMgt->SetPlaybackDelegate((char*)[_strDID UTF8String], self);
            _m_PPPPChannelMgt->PPPPStartPlayback((char*)[_strDID UTF8String], (char *)[@"20140325130648_100.h260" UTF8String], 0);
        }
            break;
        case 4:
        {
            
            _m_PPPPChannelMgt->SetAlarmDelegate((char*)[_strDID UTF8String], self);
            _m_PPPPChannelMgt->SetAlarm((char*)[_strDID UTF8String], 0, 0,0, 0, 0,0, 0,
                                        0, 0, 0);
        }
            break;
            default:
            break;
    }
}

#pragma mark DateTimeProtocol <NSObject>

- (void) AlarmProtocolResult:(int)motion_armed
          motion_sensitivity:(int)motion_sensitivity
                 input_armed:(int)input_armed
                  ioin_level:(int)ioin_level
              alarmpresetsit:(int)alarmpresetsit
                   iolinkage:(int)iolinkage
                 ioout_level:(int)ioout_level
                        mail:(int)mail
                    snapshot:(int)snapshot
             upload_interval:(int)upload_interval
                      record:(int)record{
    
    NSLog(@"1");
    
    
}
//Play Back Protocol
- (void) ImageNotify: (UIImage *)image timestamp: (NSInteger)timestamp DID:(NSString *)did{
    NSLog(@"1");
}

- (void) YUVNotify: (Byte*) yuv length:(int)length width: (int) width height:(int)height timestamp:(unsigned int)timestamp DID:(NSString *)did{
    NSLog(@"2");
}

- (void) H264Data: (Byte*) h264Frame length: (int) length type: (int) type timestamp: (NSInteger) timestamp{
    NSLog(@"3");
}

/*
#pragma mark playback <NSObject>
- (void) PlaybackStop{
    NSLog(@"1");
    
}
- (void) PlaybackTotalTime: (NSInteger) nTotalTime{
    NSLog(@"2");
}
- (void) PlaybackPos: (NSInteger) nPos{
    NSLog(@"3");
}
- (void) PlaybackData: (UIImage*) image{
    NSLog(@"4");
}
- (void) PlaybackData: (Byte*) yuv length:(int)length width:(int)width height:(int)height{
    NSLog(@"5");
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
