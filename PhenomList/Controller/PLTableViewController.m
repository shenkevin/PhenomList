//
//  PLTableViewController.m
//  PhenomList
//
//  Created by Sean Yu on 12/23/11.
//  Copyright (c) 2011 Blackboard Mobile. All rights reserved.
//

#import "PLTableViewController.h"

@implementation PLTableViewController

@synthesize dataState = data_state;

#pragma mark - 
#pragma mark Static Methods

+ (UITableViewCell *)noResultsCell
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"no results cell"];
    
    cell.textLabel.text = @"No Results";
    
    return cell;
}

+ (UITableViewCell *)loadingCell
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"no results cell"];
    
    cell.textLabel.text = @"Loading...";
    
    return cell;
}

+ (UITableViewCell *)blankCell
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"no results cell"];
    
    return cell;
}

#pragma mark - 
#pragma mark TableView Method Overrides

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    switch (self.dataState)
    {
        case PLDataStateHasData:
            return [self numberOfDataSections];
            break;
        case PLDataStateNoResults:
            return [self numberOfNoResultsSections];
            break;
        case PLDataStateLoading:
            return [self numberOfLoadingSections];
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (self.dataState)
    {
        case PLDataStateHasData:
            return [self numberOfDataRowsInSection:section];
            break;
        case PLDataStateNoResults:
            return [self numberOfNoResultsRowsInSection:section];
            break;
        case PLDataStateLoading:
            return [self numberOfLoadingRowsInSection:section];
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.dataState)
    {
        case PLDataStateHasData:
            return [self dataCellForRowAtIndexPath:indexPath];
            break;
        case PLDataStateNoResults:
            return [self noResultsCellForRowAtIndexPath:indexPath];
            break;
        case PLDataStateLoading:
            return [self loadingCellForRowAtIndexPath:indexPath];
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dataState == PLDataStateHasData)
    {
        return [self heightForDataRowAtIndexPath:indexPath];
    }
    else if(self.dataState == PLDataStateLoading)
    {
        return [self heightForLoadingRowAtIndexPath:indexPath];
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.dataState)
    {
        case PLDataStateHasData:
            [self didSelectDataRowAtIndexPath:indexPath];
            break;
        case PLDataStateNoResults:
            break;
        case PLDataStateLoading:
            break;
    }
}

#pragma mark - 
#pragma mark Data Stuff

- (void)gotData:(id)theData
{
	if ([theData count] == 0)
	{
		data = nil;
		self.dataState = PLDataStateNoResults;
	}
	else
	{
		data = theData;
		self.dataState = PLDataStateHasData;
	}
	
	[self.tableView reloadData];
}

#pragma mark - 
#pragma mark Has Data Methods

- (NSInteger)numberOfDataSections
{
    if (self.tableView.style == UITableViewStylePlain)
        return 1;
    else 
        return [data count];
}

- (NSInteger)numberOfDataRowsInSection:(NSInteger)section
{
    if (self.tableView.style == UITableViewStylePlain)
        return [data count];
    else 
        return [[data objectAtIndex:section] count];
}

- (UITableViewCell *)dataCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"section %i, row %i", indexPath.section, indexPath.row];
    return cell;
}

- (CGFloat)heightForDataRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


- (void)didSelectDataRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - 
#pragma mark No Results Methods

- (NSInteger)numberOfNoResultsSections
{
    return 1;
}

- (NSInteger)numberOfNoResultsRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)noResultsCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self class] noResultsCell];
}

- (void)didSelectNoResultsRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - 
#pragma mark Loading Methods

- (NSInteger)numberOfLoadingSections
{
    return 1;
}

- (NSInteger)numberOfLoadingRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)loadingCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self class] loadingCell];
}

- (void)didSelectLoadingRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)heightForLoadingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark - 
#pragma mark Setters and Getters

- (void)setDataState:(PLDataState)dataState
{
    if (data_state == dataState)
        return;
    
    data_state = dataState;
    [self.tableView reloadData];
}

@end
