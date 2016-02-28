//
//  BooksSearchTableViewController.m
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import "BooksSearchTableViewController.h"
#import "BooksSearchTableViewModel.h"
#import "BookTableViewCellModel.h"
#import "BookTableViewCell.h"

@interface BooksSearchTableViewController ()
@property (nonatomic) BooksSearchTableViewModel *tableViewModel;
@end

@implementation BooksSearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 100;
    self.tableViewModel = [[BooksSearchTableViewModel alloc] init];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.tableViewModel searchBooksWithKeyword:searchBar.text completion:^{
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableViewModel.cellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BookTableViewCell *cell = (BookTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"BookTableViewCell"];
    [cell configureCellWithModel:self.tableViewModel.cellModels[indexPath.row]];
    return cell;
}

@end
