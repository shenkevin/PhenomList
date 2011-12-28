//
//  PLListsController.m
//  PhenomList
//
//  Created by Sean Yu on 12/23/11.
//  Copyright (c) 2011 Blackboard Mobile. All rights reserved.
//

#import "PLListsController.h"
#import "PLRequest.h"
#import "PLURL.h"
#import "PLListParser.h"

@implementation PLListsController

- (id)init
{
    if (self = [super init])
    {
        self.title = @"PhenomList";
        
        PLRequest *request = [[PLRequest alloc] initWithURL:[PLURL listsURL] andParserClass:[PLListParser class]];
        [request performRequestWithSuccessBlock:^(id result){
            
            data = result;
            //self.dataState = PLDataStateHasData;
            data_state = PLDataStateHasData;
            
        }andFailureBlock:^(NSError *error){
            
            
            
        }];
        
        self.dataState = PLDataStateLoading;
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(wtf)];
    }
    return self;
}

- (void)wtf
{
    NSLog(@"test");
    //[self.tableView reloadData];
}

- (NSInteger)numberOfDataSections
{
    return 1;
}

- (NSInteger)numberOfDataRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)dataCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"section %i, row %i", indexPath.section, indexPath.row];
    return cell;
}

- (void)didSelectDataRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
