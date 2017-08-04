//
//  LoginVC.m
//  Test-SlideOutMenu
//
//  Created by Uber on 03/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "LoginVC.h"
@import LGSideMenuController;

#import "MainTVC.h"
#import "LeftMenuTVC.h"
#import "RightMenuTVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}


#pragma mark - Action

- (IBAction)signInAction:(id)sender {
    
    MainTVC*      mainTVC  = [[MainTVC alloc] init];
    LeftMenuTVC*  leftTVC  = [[LeftMenuTVC alloc] init];
    RightMenuTVC* rightTVC = [[RightMenuTVC alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainTVC];
    navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
    
    [navigationController.navigationBar setTitleTextAttributes:  @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                   NSFontAttributeName:[UIFont fontWithName:@"Avenir Next" size:18]}];
    
    LGSideMenuController *sideMenuController = [LGSideMenuController sideMenuControllerWithRootViewController:navigationController
                                                                                           leftViewController:leftTVC
                                                                                          rightViewController:rightTVC];
    
    sideMenuController.leftViewWidth = 250.0;
    sideMenuController.leftViewPresentationStyle = LGSideMenuPresentationStyleScaleFromBig;
    sideMenuController.rightViewWidth = 100.0;
    sideMenuController.leftViewPresentationStyle = LGSideMenuPresentationStyleSlideBelow;
    
    sideMenuController.leftViewBackgroundBlurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    
    [self presentViewController:sideMenuController animated:YES completion:nil];

    
}



@end
