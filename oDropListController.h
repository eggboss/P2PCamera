//
//  oDropListController.h
//  P2PCamera
//
//  Created by mac on 12-10-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface oDropListController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    
    IBOutlet UITableView *tableView;
    IBOutlet UINavigationBar *navigationBar;
    
    //0:移动侦测灵敏度
    int m_nIndexDrop;
}

@property (nonatomic, retain) UITableView *tableView;
@property (retain, nonatomic) UINavigationBar *navigationBar;
@end
