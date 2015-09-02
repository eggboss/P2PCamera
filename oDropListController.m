//
//  oDropListController.m
//  P2PCamera
//
//  Created by mac on 12-10-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "oDropListController.h"
#import "obj_common.h"
#import "oDorpListCell.h"

@interface oDropListController ()

@end

@implementation oDropListController

@synthesize tableView;
@synthesize navigationBar;



struct __motion_level{
int index;
char szName[16];
};
__motion_level motion_level[10] = 
{
    {1,"1"},
    {2,"2"},
    {3,"3"},
    {4,"4"},
    {5,"5"},
    {6,"6"},
    {7,"7"},
    {8,"8"},
    {9,"9"},
    {10,"10"},
};


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        m_nIndexDrop = 0;
    }
    return self;
}
- (void) btnBack: (id) sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *strTitle = NSLocalizedStringFromTable(@"AlarmSetting", @STR_LOCALIZED_FILE_NAME, nil);
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:strTitle];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedStringFromTable(@"Back", @STR_LOCALIZED_FILE_NAME, nil)    
                                                                   style:UIBarButtonItemStyleBordered     
                                                                  target:self                                                                      action:@selector(btnBack:)];
    
    leftButton.tintColor = [UIColor colorWithRed:COLOR_BASE_RED/255 green:COLOR_BASE_GREEN/255 blue:COLOR_BASE_BLUE/255 alpha:0.5];
    
    item.leftBarButtonItem = leftButton;
    //item.rightBarButtonItem = rightButton;
    
    NSArray *array = [NSArray arrayWithObjects:item, nil];    
    [self.navigationBar setItems:array];
    
    
    //self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:COLOR_HIGH_LIGHT_RED/255.0f green:COLOR_HIGH_LIGHT_GREEN/255.0f blue:COLOR_HIGH_LIGHT_BLUE/255.0f alpha:1.0f];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark -
#pragma mark TableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section
{
    if (m_nIndexDrop == 0) {
        return 10;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)anIndexPath
{
    
    if (m_nIndexDrop == 0) {
        
        NSString *cellIdentifier = @"alarm";	
        UITableViewCell *cell1 =  [aTableView dequeueReusableCellWithIdentifier:cellIdentifier];
        //disable selected cell
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (cell1 == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"oDropListCell" owner:self options:nil];
            cell1 = [nib objectAtIndex:0];
        }
        
        oDorpListCell * cell = (oDorpListCell*)cell1;
        cell.keyLable.text = [[[NSString alloc] initWithUTF8String:motion_level[anIndexPath.row].szName] autorelease];;
        //motion_level[anIndexPath.row].szName;
        
        return cell1;
    }


    
    
//    NSString *cellIdentifier = @"alarm";	
//    UITableViewCell *cell1 =  [aTableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    //disable selected cell
//    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
//    
//    NSInteger row = anIndexPath.row;
//    switch (row) {
//        case 0: 
//        {
//            if (cell1 == nil)
//            {
//                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"oSwitchCell" owner:self options:nil];
//                cell1 = [nib objectAtIndex:0];
//            }
//            oSwitchCell * cell = (oSwitchCell*)cell1;
//            cell.keyLable.text = NSLocalizedStringFromTable(@"alarmMotionEnable", @STR_LOCALIZED_FILE_NAME, nil);
//            // cell.textLabel.placeholder = NSLocalizedStringFromTable(@"InputUserName", @STR_LOCALIZED_FILE_NAME, nil);            
//            //cell.keySwitch.text = self.m_dateTime;
//            //[cell.textLabel setEnabled: NO];
//        }
//            break;
//        case 1: 
//        {
//            if (cell1 == nil)
//            {
//                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"oLableCell" owner:self options:nil];
//                cell1 = [nib objectAtIndex:0];
//            }
//            oLableCell * cell = (oLableCell*)cell1;
//            cell.keyLable.text = NSLocalizedStringFromTable(@"alarmMotionLevel", @STR_LOCALIZED_FILE_NAME, nil);
//            // cell.textLabel.placeholder = NSLocalizedStringFromTable(@"InputUserName", @STR_LOCALIZED_FILE_NAME, nil);            
//            //cell.textLabel.text = self.m_dateTime;
//            [cell.textLabel setEnabled: NO];
//        }
//            break;
//            
//            
//            
//            
//        case 2: 
//        {
//            if (cell1 == nil)
//            {
//                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"oSwitchCell" owner:self options:nil];
//                cell1 = [nib objectAtIndex:0];
//            }
//            oSwitchCell * cell = (oSwitchCell*)cell1;
//            cell.keyLable.text = NSLocalizedStringFromTable(@"alarmExtern", @STR_LOCALIZED_FILE_NAME, nil);
//            // cell.textLabel.placeholder = NSLocalizedStringFromTable(@"InputUserName", @STR_LOCALIZED_FILE_NAME, nil);            
//            //cell.keySwitch.text = self.m_dateTime;
//            //[cell.textLabel setEnabled: NO];
//        }
//            break;
//        case 3: 
//        {
//            if (cell1 == nil)
//            {
//                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"oLableCell" owner:self options:nil];
//                cell1 = [nib objectAtIndex:0];
//            }
//            oLableCell * cell = (oLableCell*)cell1;
//            cell.keyLable.text = NSLocalizedStringFromTable(@"alarmExternLevel", @STR_LOCALIZED_FILE_NAME, nil);
//            // cell.textLabel.placeholder = NSLocalizedStringFromTable(@"InputUserName", @STR_LOCALIZED_FILE_NAME, nil);            
//            //cell.textLabel.text = self.m_dateTime;
//            [cell.textLabel setEnabled: NO];
//        }
//            break;
//            
//            
//            
//            
//            
//        case 4: 
//        {
//            if (cell1 == nil)
//            {
//                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"oLableCell" owner:self options:nil];
//                cell1 = [nib objectAtIndex:0];
//            }
//            oLableCell * cell = (oLableCell*)cell1;
//            cell.keyLable.text = NSLocalizedStringFromTable(@"alarmMotionPreset", @STR_LOCALIZED_FILE_NAME, nil);
//            // cell.textLabel.placeholder = NSLocalizedStringFromTable(@"InputUserName", @STR_LOCALIZED_FILE_NAME, nil);            
//            //.textLabel.text = self.m_dateTime;
//            [cell.textLabel setEnabled: NO];
//        }
//            break;
//            
//            
//            
//        case 5: 
//        {
//            if (cell1 == nil)
//            {
//                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"oSwitchCell" owner:self options:nil];
//                cell1 = [nib objectAtIndex:0];
//            }
//            oSwitchCell * cell = (oSwitchCell*)cell1;
//            cell.keyLable.text = NSLocalizedStringFromTable(@"alarmMotionIO", @STR_LOCALIZED_FILE_NAME, nil);
//            // cell.textLabel.placeholder = NSLocalizedStringFromTable(@"InputUserName", @STR_LOCALIZED_FILE_NAME, nil);            
//            //cell.keySwitch.text = self.m_dateTime;
//            //[cell.textLabel setEnabled: NO];
//        }
//            break;
//        case 6: 
//        {
//            if (cell1 == nil)
//            {
//                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"oLableCell" owner:self options:nil];
//                cell1 = [nib objectAtIndex:0];
//            }
//            oLableCell * cell = (oLableCell*)cell1;
//            cell.keyLable.text = NSLocalizedStringFromTable(@"alarmMotionIOLevel", @STR_LOCALIZED_FILE_NAME, nil);
//            // cell.textLabel.placeholder = NSLocalizedStringFromTable(@"InputUserName", @STR_LOCALIZED_FILE_NAME, nil);            
//            //cell.textLabel.text = self.m_dateTime;
//            [cell.textLabel setEnabled: NO];
//        }
//            break;
//            
//            
//            
//            
//            
//        case 7: 
//        {
//            if (cell1 == nil)
//            {
//                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"oSwitchCell" owner:self options:nil];
//                cell1 = [nib objectAtIndex:0];
//            }
//            oSwitchCell * cell = (oSwitchCell*)cell1;
//            cell.keyLable.text = NSLocalizedStringFromTable(@"alarmMail", @STR_LOCALIZED_FILE_NAME, nil);
//            // cell.textLabel.placeholder = NSLocalizedStringFromTable(@"InputUserName", @STR_LOCALIZED_FILE_NAME, nil);            
//            //cell.keySwitch.text = self.m_dateTime;
//            //[cell.textLabel setEnabled: NO];
//        }
//            break;
//        case 8: 
//        {
//            if (cell1 == nil)
//            {
//                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"oSwitchCell" owner:self options:nil];
//                cell1 = [nib objectAtIndex:0];
//            }
//            oSwitchCell * cell = (oSwitchCell*)cell1;
//            cell.keyLable.text = NSLocalizedStringFromTable(@"alarmPicEnable", @STR_LOCALIZED_FILE_NAME, nil);
//            // cell.textLabel.placeholder = NSLocalizedStringFromTable(@"InputUserName", @STR_LOCALIZED_FILE_NAME, nil);            
//            //cell.keySwitch.text = self.m_dateTime;
//            //[cell.textLabel setEnabled: NO];
//        }
//            break;
//        case 9: 
//        {
//            if (cell1 == nil)
//            {
//                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"oLableCell" owner:self options:nil];
//                cell1 = [nib objectAtIndex:0];
//            }
//            oLableCell * cell = (oLableCell*)cell1;
//            cell.keyLable.text = NSLocalizedStringFromTable(@"alarmPicTimer", @STR_LOCALIZED_FILE_NAME, nil);
//            // cell.textLabel.placeholder = NSLocalizedStringFromTable(@"InputUserName", @STR_LOCALIZED_FILE_NAME, nil);            
//            //.textLabel.text = self.m_dateTime;
//            [cell.textLabel setEnabled: NO];
//        }
//            break;
//        default:
//            break;
//    }
//    
//    //    cell.textField.delegate = self;
//    //    cell.textField.tag = row; 
//    
//	
//	return cell1;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)anIndexPath
{
    //    [currentTextField resignFirstResponder];
    [aTableView deselectRowAtIndexPath:anIndexPath animated:YES];
}
@end
