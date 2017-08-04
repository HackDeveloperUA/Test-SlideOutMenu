//
//  LeftMenuTVC.m
//  Test-SlideOutMenu
//
//  Created by Uber on 03/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "LeftMenuTVC.h"
#import "UIViewController+LGSideMenuController.h"

//Cell
#import "LeftViewCell.h"
// Controllers
#import "MainTVC.h"

@interface LeftMenuTVC ()
@property NSArray* dataTitles;
@property NSArray* dataImageName;

@end

@implementation LeftMenuTVC


- (id)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.dataTitles   = @[@"Candle",@"Cauldron",@"Fence",@"Pumpkin",@"Scarecrow"];
        self.dataImageName = @[@"Candle",@"Cauldron",@"Fence",@"Pumpkin",@"Scarecrow"];

        self.view.backgroundColor = [UIColor darkGrayColor];
        
        [self.tableView registerClass:[LeftViewCell class] forCellReuseIdentifier:@"cell"];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.contentInset = UIEdgeInsetsMake(44.0, 0.0, 44.0, 0.0);
        self.tableView.showsVerticalScrollIndicator = NO;
    }
    return self;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56.f;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataTitles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier = @"LeftViewCell";
    LeftViewCell* cell = (LeftViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell){
        NSArray* nib = [[NSBundle mainBundle] loadNibNamed:@"LeftViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.myLabel.text = self.dataTitles[indexPath.row];
    cell.myImageView.image = [UIImage imageNamed:self.dataImageName[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UINavigationController *mainNavContr = (UINavigationController *)self.sideMenuController.rootViewController;
    MainTVC* mainTVC = (MainTVC*)mainNavContr.viewControllers[0];
    [mainTVC updateTableContentWithCategory:indexPath.row];
    // Но вообще-то можено использовать и так
    [self hideLeftViewAnimated:nil];

}

@end
