//
//  MainTVC.h
//  Test-SlideOutMenu
//
//  Created by Uber on 03/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <UIKit/UIKit.h>

@import LGSideMenuController;
@import FLKAutoLayout;


typedef NS_ENUM(NSInteger, CategoryFromLeftSideMenu) {
    Candle,
    Cauldron,
    Fence,
    Pumpkin,
    Scarecrow
};

//@interface MainTVC : LGSideMenuController <UITableViewDelegate, UITableViewDataSource>
//@interface MainTVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@interface MainTVC : UITableViewController

- (void) updateTableContentWithCategory:(CategoryFromLeftSideMenu) category;

//@property (nonatomic, strong) UITableView* tableView;

@end
