//
//  KDScrollableTabs.m
//  KDScrollableTabs
//
//  Created by Kedar Desai on 13/02/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "KDScrollableTabs.h"

@implementation KDScrollableTabs


#pragma mark UIViewLifeCycle Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
    }
    
    return self;
}


#pragma mark Public Methods

- (void)loadView
{
    // horizontal table
    // -90 degrees rotation will move top of your tableview to the left
    CGRect frame = self.frame;
    self.horizontalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.height, frame.size.width)];
    self.horizontalTableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    
    self.horizontalTableView.delegate = self;
    self.horizontalTableView.dataSource = self;
    
    [self.horizontalTableView setShowsHorizontalScrollIndicator:NO];
    [self.horizontalTableView setShowsVerticalScrollIndicator:NO];
    
    [self.horizontalTableView setFrame:CGRectMake(0, 0, self.horizontalTableView.frame.size.width, self.horizontalTableView.frame.size.height)];
    [self.horizontalTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self addSubview:self.horizontalTableView];
}


#pragma mark UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfTabs = [self.datasource numberOfTabs];
    return numberOfTabs;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat widthForTab = [self.datasource widthForTabAtIndexPath:indexPath.row];
    return widthForTab;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    
    CGAffineTransform trans = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI_2);
    
    UIView *contentView = [self.datasource viewForTabAtIndexPath:indexPath.row];
    contentView.transform = trans; // rotating contentView;
    contentView.tag = 786;
    
    CGRect contentViewFrame = contentView.frame;
    if ([self.datasource widthForTabAtIndexPath:indexPath.row] < contentViewFrame.size.height) { // If Width for tab is less than the view to be shown in the tab.
        [NSException raise:@"Invalid width argument" format:@"Width for tab should be greater than the view to be shown in the tab."];
    }
    contentViewFrame.origin.x = (self.frame.size.height - contentViewFrame.size.width)/2;
    contentViewFrame.origin.y = ([self.datasource widthForTabAtIndexPath:indexPath.row] - contentViewFrame.size.height)/2;
    contentView.frame = contentViewFrame;
    
    [cell addSubview:contentView];
    
    UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [self.datasource widthForTabAtIndexPath:indexPath.row]-1, 1)];/// change size as you need.
    separatorLineView.backgroundColor = [UIColor lightGrayColor];// you can also put image here
    [cell.contentView addSubview:separatorLineView];
    
    return cell;
}


#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.horizontalTableView cellForRowAtIndexPath:indexPath];
    UIView *contentView = [cell.contentView viewWithTag:786];
    
    [self.delegate didSelectTabAtIndexPath:indexPath.row forView:contentView];
}


#pragma mark Public Methods

- (void)tabViewForIndexPath:(NSInteger)indexPath
{
    NSIndexPath *tableViewIndexPath = [NSIndexPath indexPathForRow:indexPath inSection:1];
    
    UITableViewCell *cell = [self.horizontalTableView cellForRowAtIndexPath:tableViewIndexPath];
    UIView *contentView = [cell.contentView viewWithTag:786];
    
    [self.datasource tabWithIndexPath:indexPath andView:contentView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
