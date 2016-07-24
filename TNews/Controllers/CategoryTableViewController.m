//
//  CategoryTableViewController.m
//  TNews
//
//  Created by Soner Güler on 24/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "CategoryTableViewController.h"

@interface CategoryTableViewController ()

@property (nonatomic,strong)NSArray *categories;

@end

@implementation CategoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getCategories];
    
    
}

#pragma mark - SERVICE

- (void)getCategories {
    [SVProgressHUD show];
    
    [[ServiceManager sharedManager] getCategories_completition:^(NSArray *categories, BOOL success, NSError *error) {
        
        [SVProgressHUD dismiss];
        
        self.categories = [NSArray arrayWithArray:categories];
        [self.tableView reloadData];
    }];
}


#pragma mark - ACTION


- (IBAction)dismiss{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell" forIndexPath:indexPath];
    
    
    NewsCategory *currentCategory = [self.categories objectAtIndex:indexPath.row];
    cell.textLabel.text = currentCategory.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    NewsCategory *selectedCategory = [self.categories objectAtIndex:indexPath.row];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadNewsWithCategory" object:selectedCategory];
    [self dismiss];
}


@end
