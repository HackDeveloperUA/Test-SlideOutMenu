//
//  LeftViewCell.h
//  Test-SlideOutMenu
//
//  Created by Uber on 03/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewCell : UITableViewCell
@property (strong, nonatomic) UIView *separatorView;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@end
