//
//  BNRItemsTableViewController.m
//  Homepwner
//
//  Created by Xiao Lu on 6/14/15.
//  Copyright (c) 2015 Xiao Lu. All rights reserved.
//

#import "BNRItemsTableViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemsTableViewController ()

@end

@implementation BNRItemsTableViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 10; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
        return [[[BNRItemStore sharedStore] allItemsUnder50] count] + 1;
    else
        return [[[BNRItemStore sharedStore] allItemsEqualAbove50] count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    
    NSLog(@"section is %ld and row is %ld", (long)indexPath.section, (long)indexPath.row);
    
    NSString *message = [[NSString alloc] init];
    if (indexPath.section == 0) {
        NSArray *items = [[BNRItemStore sharedStore] allItemsUnder50];
        if (indexPath.row < [items count])
            message = [items[indexPath.row] description];
        else
            message = @"No more items!";
    }
    else {
        NSArray *items = [[BNRItemStore sharedStore] allItemsEqualAbove50];
        if (indexPath.row < [items count])
            message = [items[indexPath.row] description];
        else
            message = @"No more items!";
    }
    
    cell.textLabel.text = message;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return @"Less than $50";
    else
        return @"More than $50";
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0
        && indexPath.row == [[[BNRItemStore sharedStore] allItemsUnder50] count] + 1)
        return 44;
    else if (indexPath.section == 1
             && indexPath.row == [[[BNRItemStore sharedStore] allItemsEqualAbove50] count] + 1)
        return 44;
    else
        return 60;
}

@end