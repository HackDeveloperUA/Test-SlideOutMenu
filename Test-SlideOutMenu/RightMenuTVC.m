//
//  RightMenuTVC.m
//  Test-SlideOutMenu
//
//  Created by Uber on 03/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "RightMenuTVC.h"

@interface RightMenuTVC ()
@property NSArray* dataArray;
@end

@implementation RightMenuTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@"1",@"2",@"3",@"4",@"5"];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
@end
