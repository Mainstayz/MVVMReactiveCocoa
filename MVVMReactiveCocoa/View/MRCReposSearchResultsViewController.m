//
//  MRCReposSearchResultsViewController.m
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 15/5/10.
//  Copyright (c) 2015年 leichunfeng. All rights reserved.
//

#import "MRCReposSearchResultsViewController.h"
#import "MRCReposSearchResultsViewModel.h"
#import "MRCReposTableViewCell.h"
#import "MRCReposSearchResultsItemViewModel.h"

@interface MRCReposSearchResultsViewController ()

@property (nonatomic, strong, readonly) MRCReposSearchResultsViewModel *viewModel;

@end

@implementation MRCReposSearchResultsViewController

@dynamic viewModel;

- (NSString *)labelText {
    return @"Searching";
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.viewModel.query = searchText;
    self.viewModel.dataSource = nil;
    self.viewModel.shouldDisplayEmptyDataSet = NO;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (searchBar.text.length > 0) {
        [self.viewModel.requestRemoteDataCommand execute:nil];
    }
}

#pragma mark - DZNEmptyDataSetSource

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    return [[NSAttributedString alloc] initWithString:@"No Results"];
}

@end
