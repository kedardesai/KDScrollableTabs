//
//  KDScrollableTabs.h
//  KDScrollableTabs
//
//  Created by Kedar Desai on 13/02/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KDScrollableTabsDatasource <NSObject>

@required
- (NSInteger)numberOfTabs;
- (UIView *)viewForTabAtIndexPath:(NSInteger)indexPath;
- (CGFloat)widthForTabAtIndexPath:(NSInteger)indexPath;

@optional
- (void)tabWithIndexPath:(NSInteger)indexPath andView:(UIView *)view;

@end

@protocol KDScrollableTabsDelegate <NSObject>

@required
- (void)didSelectTabAtIndexPath:(NSInteger)indexPath forView:(UIView *)view;

@end

@interface KDScrollableTabs : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *horizontalTableView;

@property (nonatomic, strong) id <KDScrollableTabsDatasource> datasource;
@property (nonatomic, strong) id <KDScrollableTabsDelegate> delegate;

- (void)tabViewForIndexPath:(NSInteger)indexPath;

- (void)loadView;

@end
