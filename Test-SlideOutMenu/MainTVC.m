//
//  MainTVC.m
//  Test-SlideOutMenu
//
//  Created by Uber on 03/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "MainTVC.h"
#import "Masonry.h"

@interface MainTVC ()
@property NSArray* dataArray;

@end

@implementation MainTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"1",@"2",@"3",@"4",@"5"];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void) updateTableContentWithCategory:(CategoryFromLeftSideMenu) category
{
     switch (category) {
        case Candle:   [self fillingArray:&_dataArray andCategory:@"Candle"];   break;
        case Cauldron: [self fillingArray:&_dataArray andCategory:@"Cauldron"]; break;
        case Fence:    [self fillingArray:&_dataArray andCategory:@"Fence"];    break;
        case Pumpkin:  [self fillingArray:&_dataArray andCategory:@"Pumpkin"];  break;
        case Scarecrow:[self fillingArray:&_dataArray andCategory:@"Scarecrow"];break;

        default: break;
    }
}


- (void)fillingArray:(__strong NSArray**) arr andCategory:(NSString*) category
{
    NSMutableArray* tempArr = [NSMutableArray array];
    for (int i=0; i<=10; i++) {
        [tempArr addObject:[NSString stringWithFormat:@"%@ - %d", category, i]];
    }
    *arr = [NSArray arrayWithArray:tempArr];
    [self.tableView reloadData];
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


#pragma mark - Other

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"LGSideMenuController";
        self.view.backgroundColor = [UIColor whiteColor];
 
        UIImage *hamburg = [[UIImage imageNamed:@"Hamburg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *inbox   = [[UIImage imageNamed:@"Inbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:hamburg style:UIBarButtonItemStylePlain target:self action:@selector(showLeftView)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:inbox style:UIBarButtonItemStylePlain target:self action:@selector(showRightView)];
    }
    return self;
}



#pragma mark -

- (void)showLeftView {
    [self.sideMenuController showLeftViewAnimated:YES completionHandler:nil];
}

- (void)showRightView {
    [self.sideMenuController showRightViewAnimated:YES completionHandler:nil];
}

- (void)showChooseController {
   
    // Return on main controller
    /*
    ChooseNavigationController *navigationController = [ChooseNavigationController new];
    
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    window.rootViewController = navigationController;
    
    [UIView transitionWithView:window
                      duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:nil
                    completion:nil];
     */
}

@end
